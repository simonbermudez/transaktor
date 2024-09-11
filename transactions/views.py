from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import *
from .serializers import TransactionSerializer
from rest_framework import generics
from django.shortcuts import render 
from datetime import datetime, timedelta

from rest_framework.decorators import api_view, renderer_classes
from rest_framework.renderers import JSONRenderer, TemplateHTMLRenderer

from django.contrib.auth.decorators import login_required

from collections import Counter

# create an html view that will list all transactions
# require login to access this view
@login_required
def transactions(request):
    transactions = Transaction.objects.filter(amount__lt=0, category__visible=True).order_by('-date')
    categories = Category.objects.all().order_by('name')
    context = {
        'transactions': transactions,
        'categories': categories,
        'total_last_30_days': sum([transaction.amount for transaction in transactions if transaction.date >= datetime.now().date() - timedelta(days=30)]),
        'total_last_month': sum([transaction.amount for transaction in transactions if transaction.date.month == datetime.now().month - 1]),
        'total_this_month': sum([transaction.amount for transaction in transactions if transaction.date.month == datetime.now().month]), 
        'total_this_year': sum([transaction.amount for transaction in transactions if transaction.date.year == datetime.now().year]),
        'total': sum([transaction.amount for transaction in transactions]),
        'expense_by_category_this_month': {category: sum([transaction.amount for transaction in transactions if transaction.category == category and transaction.date.month == datetime.now().month]) for category in categories},
        'expense_by_category_last_month': {category: sum([transaction.amount for transaction in transactions if transaction.category == category and transaction.date.month == datetime.now().month - 1]) for category in categories},
        'total_budget': sum([category.budget for category in categories])
    }
    return render(request, 'transactions.html', context)

@api_view(('GET',))
def category_tokens(request):
    categories = Category.objects.all()
    tokens = {}
    for category in categories:
        tokens[category.name] = dict(Counter((" ".join([t.description for t in category.transactions.all()]).split(" "))).most_common())

    # json response 
    return Response(tokens)

class TransactionListView(generics.ListAPIView):
    queryset = Transaction.objects.all()
    serializer_class = TransactionSerializer

@api_view(['POST'])
def create_transactions(request):
    if not isinstance(request.data, list):
        return Response({"error": "Expected a list of transactions"}, status=status.HTTP_400_BAD_REQUEST)

    # Assuming 'id' is a unique identifier in each transaction
    transaction_ids = [transaction['id'] for transaction in request.data]
    existing_transactions = Transaction.objects.filter(id__in=transaction_ids)
    existing_ids = set(existing_transactions.values_list('id', flat=True))

    # Filter out the new transactions that don't already exist
    new_transactions_data = [transaction for transaction in request.data if transaction['id'] not in existing_ids]

    if not new_transactions_data:
        return Response({"message": "All transactions already exist"}, status=status.HTTP_200_OK)

    successful_transactions = []
    failed_transactions = []

    # Serialize and save each transaction individually
    for transaction_data in new_transactions_data:
        serializer = TransactionSerializer(data=transaction_data)
        if serializer.is_valid():
            serializer.save()
            successful_transactions.append(serializer.data)
        else:
            failed_transactions.append({"transaction": transaction_data, "errors": serializer.errors})

    if successful_transactions:
        return Response(
            {
                "created": successful_transactions,
                "failed": failed_transactions
            }, 
            status=status.HTTP_201_CREATED if not failed_transactions else status.HTTP_207_MULTI_STATUS
        )
    else:
        return Response({"errors": failed_transactions}, status=status.HTTP_400_BAD_REQUEST)