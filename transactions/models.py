from django.db import models
from django.db.models.functions import Length

class Transaction(models.Model):
    id = models.CharField(max_length=250, primary_key=True)
    date = models.DateField()
    description = models.TextField()
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='transactions', null=True, blank=True)

    def __str__(self):
        return f"{self.date} - {self.description} - {self.amount}"

    def save(self, *args, **kwargs):
        # Check if association of previous transaction exists to categorize it 
        try:
            previous_category = Transaction.objects.filter(description__icontains=self.description)[1]
            if previous_category and previous_category.category:
                print("previous category found")
                self.category = previous_category.category
            else:
                for association in Association.objects.all():
                    if association.keyword.lower() in self.description.lower():
                        self.category = association.category
                        break
        except:
            pass
        
        # check if this is a duplicated transaction, delete the old one and update the new one

        try:
            old_transaction = Transaction.objects.filter(description__icontains=self.description.split(" ")[0], amount=self.amount, date=self.date).order_by(Length('description').desc())[1]
            if old_transaction:
                print("Duplicated transaction found")
                associated_category = old_transaction.category
                self.category = associated_category
                old_transaction.delete()
        except Exception as e:
            print(e)

        super(Transaction, self).save(*args, **kwargs)

class Association(models.Model):
    keyword = models.CharField(max_length=100)
    category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='associations')

    def save(self, *args, **kwargs):
        transactions_without_category = Transaction.objects.filter(category=None)
        for transaction in transactions_without_category:
            if self.keyword.lower() in transaction.description.lower():
                transaction.category = self.category
                transaction.save()
        super(Association, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.keyword} -> {self.category.name}"

class Category(models.Model):
    name = models.CharField(max_length=100, primary_key=True)
    budget = models.DecimalField(max_digits=7, decimal_places=2, default=0)

    def __str__(self):
        return f"{self.name}"