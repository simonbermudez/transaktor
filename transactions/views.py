from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import *
from .serializers import TransactionSerializer
from rest_framework import generics
from django.shortcuts import render 
from datetime import datetime, timedelta, date
import calendar
from rest_framework.decorators import api_view, renderer_classes
from rest_framework.renderers import JSONRenderer, TemplateHTMLRenderer
from django.contrib.auth.decorators import login_required
from collections import Counter
import json
from django.db.models import Sum
from django.db.models.functions import TruncMonth, TruncDay
from decimal import Decimal

# Custom JSON encoder to handle Decimal objects
class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return float(obj)
        return super(DecimalEncoder, self).default(obj)

@login_required
def transactions(request):
    selected_date = request.GET.get('month')
    if selected_date:
        selected_date = datetime.strptime(selected_date, '%Y-%m')
    else:
        selected_date = datetime.now()

    # Get last 12 months for the dropdown
    months = []
    for i in range(12):
        date = (datetime.now() - timedelta(days=30*i)).replace(day=1)
        months.append({
            'value': date.strftime('%Y-%m'),
            'label': date.strftime('%B %Y')
        })

    transactions = Transaction.objects.filter(amount__lt=0, category__visible=True).order_by('-date')
    categories = Category.objects.all().order_by('name')

    # Calculate expenses for selected month
    selected_month_expenses = {
        category: sum([
            transaction.amount 
            for transaction in transactions 
            if transaction.category == category 
            and transaction.date.month == selected_date.month 
            and transaction.date.year == selected_date.year
        ]) 
        for category in categories
    }

    # Prepare monthly chart data
    visible_categories = [category for category in categories if category.visible]
    monthly_chart_data = {
        'labels': [str(category) for category in visible_categories],
        'values': [float(abs(selected_month_expenses[category])) for category in visible_categories]
    }
    
    # Sort categories by expense amount for the chart
    combined = list(zip(monthly_chart_data['labels'], monthly_chart_data['values']))
    combined.sort(key=lambda x: x[1], reverse=True)
    monthly_chart_data['labels'], monthly_chart_data['values'] = zip(*combined) if combined else ([], [])

    # Calculate average daily spending for selected month
    days_in_month = calendar.monthrange(selected_date.year, selected_date.month)[1]
    for category in categories:
        if category.visible:
            total_spent = abs(selected_month_expenses[category])
            category.average_amount_this_month = float(total_spent) / days_in_month

    # 1. Spending Trend Graph - Last 12 months
    trend_data = []
    for i in range(11, -1, -1):
        month_date = (datetime.now() - timedelta(days=30*i)).replace(day=1)
        month_expenses = sum([
            transaction.amount 
            for transaction in transactions 
            if transaction.date.month == month_date.month 
            and transaction.date.year == month_date.year
        ])
        trend_data.append({
            'month': month_date.strftime('%b %Y'),
            'amount': float(abs(month_expenses))
        })
    
    # 2. Budget vs Actual Graph
    budget_vs_actual = []
    for category in visible_categories:
        if category.budget > 0:  # Only include categories with a budget
            budget_vs_actual.append({
                'category': str(category),
                'budget': float(category.budget),
                'actual': float(abs(selected_month_expenses[category]))
            })
    # Sort by budget amount
    budget_vs_actual.sort(key=lambda x: x['budget'], reverse=True)
    
    # 3. Daily Spending Graph for selected month
    daily_spending = []
    start_date = selected_date.replace(day=1)
    end_date = (start_date.replace(day=28) + timedelta(days=4)).replace(day=1) - timedelta(days=1)
    current_date = start_date
    
    while current_date <= end_date:
        day_expenses = sum([
            transaction.amount 
            for transaction in transactions 
            if transaction.date == current_date.date()
        ])
        daily_spending.append({
            'date': current_date.strftime('%d'),
            'amount': float(abs(day_expenses))
        })
        current_date += timedelta(days=1)
    
    # 4. Top 5 Expenses
    top_expenses = []
    for category in visible_categories:
        expense = abs(selected_month_expenses[category])
        if expense > 0:
            top_expenses.append({
                'category': str(category),
                'amount': float(expense)
            })
    top_expenses.sort(key=lambda x: x['amount'], reverse=True)
    top_expenses = top_expenses[:5]  # Get only top 5
    
    # 5. Savings Rate Graph
    income_transactions = Transaction.objects.filter(amount__gt=0).order_by('-date')
    savings_data = []
    
    for i in range(5, -1, -1):
        month_date = (datetime.now() - timedelta(days=30*i)).replace(day=1)
        month_income = sum([
            transaction.amount 
            for transaction in income_transactions 
            if transaction.date.month == month_date.month 
            and transaction.date.year == month_date.year
        ])
        month_expenses = abs(sum([
            transaction.amount 
            for transaction in transactions 
            if transaction.date.month == month_date.month 
            and transaction.date.year == month_date.year
        ]))
        
        savings_rate = 0
        if month_income > 0:
            savings_rate = ((month_income - month_expenses) / month_income) * 100
            
        savings_data.append({
            'month': month_date.strftime('%b %Y'),
            'rate': round(float(savings_rate), 1)
        })

    # 6. Category Spending Trends - Last 12 months
    category_trends = []
    month_labels = []
    
    # Get all visible categories
    visible_categories = [category for category in categories if category.visible]
    
    # Get the last 12 months
    for i in range(11, -1, -1):
        month_date = (datetime.now() - timedelta(days=30*i)).replace(day=1)
        month_labels.append(month_date.strftime('%b %Y'))
    
    # For each category, get monthly spending for last 12 months
    for category in visible_categories:
        monthly_amounts = []
        for i in range(11, -1, -1):
            month_date = (datetime.now() - timedelta(days=30*i)).replace(day=1)
            month_expense = sum([
                transaction.amount 
                for transaction in transactions 
                if transaction.category == category
                and transaction.date.month == month_date.month 
                and transaction.date.year == month_date.year
            ])
            monthly_amounts.append(float(abs(month_expense)))
        
        # Only include categories that have some spending in the last 12 months
        if sum(monthly_amounts) > 0:
            category_trends.append({
                'category': str(category),
                'data': monthly_amounts
            })
    
    # Sort categories by total spending (descending)
    category_trends.sort(key=lambda x: sum(x['data']), reverse=True)
    
    # Limit to top 8 categories to avoid overcrowding the chart
    category_trends = category_trends[:8]

    context = {
        'transactions': transactions,
        'categories': categories,
        'total_last_30_days': sum([transaction.amount for transaction in transactions if transaction.date >= datetime.now().date() - timedelta(days=30)]),
        'total_this_month': sum([transaction.amount for transaction in transactions if transaction.date.month == selected_date.month and transaction.date.year == selected_date.year]), 
        'total_this_year': sum([transaction.amount for transaction in transactions if transaction.date.year == datetime.now().year]),
        'total': sum([transaction.amount for transaction in transactions]),
        'expense_by_category': selected_month_expenses,
        'total_budget': sum([category.budget for category in categories]),
        'chart_data': json.dumps(monthly_chart_data, cls=DecimalEncoder),
        'months': months,
        'selected_date': selected_date.strftime('%Y-%m'),
        'selected_month_name': selected_date.strftime('%B %Y'),
        # New graph data
        'trend_data': json.dumps(trend_data, cls=DecimalEncoder),
        'budget_vs_actual': json.dumps(budget_vs_actual, cls=DecimalEncoder),
        'daily_spending': json.dumps(daily_spending, cls=DecimalEncoder),
        'top_expenses': json.dumps(top_expenses, cls=DecimalEncoder),
        'savings_data': json.dumps(savings_data, cls=DecimalEncoder),
        'category_trends': json.dumps(category_trends, cls=DecimalEncoder),
        'month_labels': json.dumps(month_labels)
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

    Transaction.cleanup()
    
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