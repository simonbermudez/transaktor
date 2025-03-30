from django.db import models
from django.db.models.functions import Length
from django.db.models import Avg, Count, Q
from django.utils import timezone
from decimal import Decimal
from typing import Optional
from django.contrib.auth.models import AbstractUser, Group, Permission
import uuid

class User(AbstractUser):
    groups = models.ManyToManyField(
        Group,
        verbose_name='groups',
        blank=True,
        help_text='The groups this user belongs to.',
        related_name='transaction_user_set'
    )
    user_permissions = models.ManyToManyField(
        Permission,
        verbose_name='user permissions',
        blank=True,
        help_text='Specific permissions for this user.',
        related_name='transaction_user_set'
    )

    class Meta:
        verbose_name = 'user'
        verbose_name_plural = 'users'

class APIKey(models.Model):
    key = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE, related_name='api_keys')
    name = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)
    last_used_at = models.DateTimeField(null=True, blank=True)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.name} ({self.user.username})"

class Transaction(models.Model):
    id = models.CharField(max_length=250, primary_key=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE, related_name='transactions')
    date = models.DateField()
    description = models.TextField()
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey('Category', on_delete=models.SET_NULL, related_name='transactions', null=True, blank=True)
    metadata = models.JSONField(null=True, blank=True)

    class Meta:
        indexes = [
            models.Index(fields=['date', 'amount']),
            models.Index(fields=['description']),
            models.Index(fields=['user']),
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
        """
        Attempts to categorize a transaction by:
        1. Looking for similar previous transactions
        2. Falling back to keyword associations
        """
        if not self.description:
            return

        # Get the first two words for better matching
        words = self.description.lower().split()[:2]
        search_term = ' '.join(words) if words else ''
        
        if search_term:
            # Try to find a similar previous transaction
            previous_transaction = (
                Transaction.objects
                .filter(
                    Q(description__icontains=search_term) |
                    Q(description__icontains=words[0] if words else '')
                )
                .exclude(id=self.id)
                .select_related('category')
                .order_by('-date')  # Get most recent match
                .first()
            )
            
            if previous_transaction and previous_transaction.category:
                self.category = previous_transaction.category
                return

        # If no similar transaction found, try associations
        associations = Association.objects.select_related('category')
        for assoc in associations:
            if assoc.keyword.lower() in self.description.lower():
                self.category = assoc.category
                return

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