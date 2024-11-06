from django.db import models
from django.db.models.functions import Length
from django.db.models import Avg, Count
from django.utils import timezone
from decimal import Decimal
from typing import Optional

class Transaction(models.Model):
    id = models.CharField(max_length=250, primary_key=True)
    date = models.DateField()
    description = models.TextField()
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey('Category', on_delete=models.SET_NULL, related_name='transactions', null=True, blank=True)
    metadata = models.JSONField(null=True, blank=True)

    class Meta:
        indexes = [
            models.Index(fields=['date', 'amount']),
            models.Index(fields=['description']),
        ]

    def __str__(self):
        return f"{self.date} - {self.description[:50]} - {self.amount}"
    
    @classmethod
    def cleanup(cls):
        cls.remove_duplicates()
        cls.remove_old_pending_transactions()

    @classmethod
    def remove_duplicates(cls):
        unique_dates = cls.objects.dates('date', 'day').distinct()
        duplicates_count = 0
        
        for date in unique_dates:
            duplicates = (
                cls.objects
                .filter(date=date)
                .values('amount', 'date')
                .annotate(count=Count('amount'))
                .filter(count=2)
            )
            
            for duplicate in duplicates:
                duplicates_count += 1
                transactions = cls.objects.filter(
                    date=date,
                    amount=duplicate['amount']
                ).order_by(Length('description').asc())
                
                if transactions.count() == 2:
                    shorter, longer = transactions
                    longer.category = shorter.category
                    longer.save(update_fields=['category'])
                    shorter.delete()
        return duplicates_count


    @classmethod
    def remove_old_pending_transactions(cls, older_than_days: int = 5):
        old_pending_transactions = cls.objects.filter(metadata__status="PENDING", date__lt=timezone.now() - timezone.timedelta(days=older_than_days))
        old_pending_transactions.delete()
        return old_pending_transactions

    def check_previous_transaction_category(self):
        first_word = self.description.split()[0].lower()
        
        try:
            previous_transaction = (
                Transaction.objects
                .filter(description__icontains=first_word)
                .exclude(id=self.id)
                .select_related('category')
                .first()
            )
            
            if previous_transaction and previous_transaction.category:
                self.category = previous_transaction.category
            else:
                self.category = next(
                    (assoc.category for assoc in Association.objects.select_related('category')
                     if assoc.keyword.lower() in self.description.lower()),
                    None
                )
        except IndexError:
            pass

        self.check_and_handle_duplicate()

    def check_and_handle_duplicate(self):
        try:
            duplicate = (
                Transaction.objects
                .filter(
                    description__icontains=self.description.split()[0],
                    amount=self.amount,
                    date=self.date
                )
                .exclude(id=self.id)
                .order_by(Length('description').desc())
                .first()
            )
            
            if duplicate:
                self.category = duplicate.category
                duplicate.delete()
        except Exception as e:
            print(f"Error handling duplicate: {e}")

    def save(self, *args, **kwargs):
        if not kwargs.pop('skip_checks', False) and not self.category:
            self.check_previous_transaction_category()
        super().save(*args, **kwargs)

class Association(models.Model):
    keyword = models.CharField(max_length=100)
    category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='associations')

    def __str__(self):
        return f"{self.keyword} -> {self.category.name}"

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        self.update_transactions()

    def update_transactions(self):
        Transaction.objects.filter(
            category__isnull=True,
            description__icontains=self.keyword
        ).update(category=self.category)

class Category(models.Model):
    name = models.CharField(max_length=100, primary_key=True)
    budget = models.DecimalField(max_digits=7, decimal_places=2, default=Decimal('0.00'))
    visible = models.BooleanField(default=True)

    class Meta:
        verbose_name = "Category"
        verbose_name_plural = "Categories"

    def __str__(self):
        return self.name

    def average_amount(self, **filters) -> Decimal:
        return self.transactions.filter(**filters).aggregate(avg=Avg('amount'))['avg'] or Decimal('0.00')

    def average_amount_for_month(self, date: Optional[timezone.datetime] = None) -> Decimal:
        date = date or timezone.now()
        return self.average_amount(date__month=date.month, date__year=date.year)

    def average_amount_this_month(self) -> Decimal:
        return self.average_amount_for_month()

    def average_amount_last_month(self) -> Decimal:
        last_month = timezone.now() - timezone.timedelta(days=30)
        return self.average_amount_for_month(last_month)