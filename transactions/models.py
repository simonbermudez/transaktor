from django.db import models
from django.db.models.functions import Length
from django.db.models import Count
from datetime import datetime 

class Transaction(models.Model):
    id = models.CharField(max_length=250, primary_key=True)
    date = models.DateField()
    description = models.TextField()
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='transactions', null=True, blank=True)
    metadata = models.JSONField(null=True, blank=True)
    
    # Function that removes duplicates from the database
    @staticmethod
    def remove_duplicates():
        # Get all unique dates of all transactions
        unique_dates = Transaction.objects.all().order_by("date").values("date").distinct()

        # Iterate over all unique dates
        for date in unique_dates:
            # Get all transactions of the current date that have duplicates by amount
            duplicates = Transaction.objects.filter(date=date["date"]).values("amount", "date").annotate(Count("amount")).filter(amount__count=2)

            # Iterate over all duplicates
            for duplicate in duplicates:
                # Get all transactions of the current date that have the same amount
                transactions = Transaction.objects.filter(date=date["date"], amount=duplicate["amount"])

                print (transactions)
                # Check if the description of the first transaction is shorter than the second
                if len(transactions[0].description) < len(transactions[1].description):
                    # Apply the category of the shorter description transaction to the longer description transaction
                    transactions[1].category = transactions[0].category
                    transactions[1].save(check=False)  # Save the updated transaction without performing validation checks
                    transactions[0].delete()  # Delete the shorter description transaction
                else:
                    # Apply the category of the shorter description transaction to the longer description transaction
                    transactions[0].category = transactions[1].category
                    transactions[0].save(check=False)  # Save the updated transaction without performing validation checks
                    transactions[1].delete()  # Delete the shorter description transaction

                # Print the transactions list
                print(transactions)


    def __str__(self):
        return f"{self.date} - {self.description} - {self.amount}"


    def check_previous_transaction_category(self):
        # Check if association of previous transaction exists to categorize it 
        try:
            previous_transaction = Transaction.objects.filter(description__icontains=self.description.split(" ")[0])[1]
            if previous_transaction and previous_transaction.category:
                print("previous category found")
                self.category = previous_transaction.category
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

    def save(self, *args, **kwargs):
        # If check=False skip the categorization
        if kwargs.get("check") == False or self.category:
            print("Skipping Checks")
            super(Transaction, self).save()
            return

        self.check_previous_transaction_category()

        super(Transaction, self).save()

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
    visible = models.BooleanField(default=True)

    def average_amount(self, filter={}):
        return int(self.transactions.filter(**filter).aggregate(models.Avg("amount"))["amount__avg"])

    def average_amount_this_month(self):
        try:
            return int(self.transactions.filter(date__month=datetime.now().month, date__year=datetime.now().year).aggregate(models.Avg("amount"))["amount__avg"])
        except:
            return 0

    def average_amount_last_month(self):
        try:
            return int(self.transactions.filter(date__month=datetime.now().month - 1, date__year=datetime.now().year).aggregate(models.Avg("amount"))["amount__avg"])
        except:
            return 0
            
    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = "Category"
        verbose_name_plural = "Categories"