from rest_framework import status
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from rest_framework.authentication import BaseAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.exceptions import AuthenticationFailed
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
import random
from django.utils import timezone
from dateutil.relativedelta import relativedelta

# Custom JSON encoder to handle Decimal objects
class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return float(obj)
        return super(DecimalEncoder, self).default(obj)

class APIKeyAuthentication(BaseAuthentication):
    def authenticate(self, request):
        api_key = request.META.get('HTTP_X_API_KEY') or request.query_params.get('api_key')
        if not api_key:
            return None

        try:
            api_key_obj = APIKey.objects.get(key=api_key, is_active=True)
            api_key_obj.last_used_at = timezone.now()
            api_key_obj.save()
            return (api_key_obj.user, api_key_obj)
        except (APIKey.DoesNotExist, ValueError):
            raise AuthenticationFailed('Invalid API key')

def generateRandomColor():
    return '#%06x' % random.randint(0, 0xFFFFFF)

@login_required
def transactions(request):
    selected_date = request.GET.get('month')
    if selected_date:
        selected_date = datetime.strptime(selected_date, '%Y-%m')
    else:
        selected_date = datetime.now()

    # Get last 12 months for the dropdown
    months = []
    current_date = datetime.now().replace(day=1)
    for i in range(12):
        date = current_date - relativedelta(months=i)
        months.append({
            'value': date.strftime('%Y-%m'),
            'label': date.strftime('%B %Y')
        })

    transactions = Transaction.objects.filter(
        user=request.user,
        amount__lt=0, 
        category__visible=True
    ).order_by('-date')
    
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
    current_date = datetime.now().replace(day=1)
    for i in range(11, -1, -1):
        month_date = current_date - relativedelta(months=i)
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
    
    # Cumulative Daily Expense Graph - Current Month vs Previous Month
    # Get current date to filter out future days
    today = datetime.now().date()
    current_day_of_month = today.day if selected_date.year == today.year and selected_date.month == today.month else 31
    
    # Current month cumulative data
    current_month_cumulative = []
    current_month_start = selected_date.replace(day=1)
    current_month_end = (current_month_start.replace(day=28) + timedelta(days=4)).replace(day=1) - timedelta(days=1)
    days_in_current_month = (current_month_end - current_month_start).days + 1  # Always get all days in month
    
    # Previous month data
    previous_month_date = selected_date - relativedelta(months=1)
    previous_month_start = previous_month_date.replace(day=1)
    previous_month_end = (previous_month_start.replace(day=28) + timedelta(days=4)).replace(day=1) - timedelta(days=1)
    days_in_previous_month = (previous_month_end - previous_month_start).days + 1  # Always get all days in month
    
    previous_month_cumulative = []
    
    # Calculate cumulative expenses for current month (only up to today if current month)
    running_total = 0
    for day in range(1, days_in_current_month + 1):
        current_date = current_month_start.replace(day=day)
        
        # For days up to today, calculate actual expenses
        if current_date.date() <= today or selected_date.year != today.year or selected_date.month != today.month:
            day_expenses = sum([
                transaction.amount 
                for transaction in transactions 
                if transaction.date == current_date.date()
            ])
            running_total += abs(day_expenses)
        
        # Only add data points up to today for current month
        if current_date.date() <= today or selected_date.year != today.year or selected_date.month != today.month:
            current_month_cumulative.append({
                'day': day,
                'date': current_date.strftime('%d'),
                'amount': float(running_total)
            })
    
    # Calculate cumulative expenses for previous month (show all days)
    running_total = 0
    for day in range(1, days_in_previous_month + 1):
        current_date = previous_month_start.replace(day=day)
        day_expenses = sum([
            transaction.amount 
            for transaction in transactions 
            if transaction.date == current_date.date()
        ])
        running_total += abs(day_expenses)
        previous_month_cumulative.append({
            'day': day,
            'date': current_date.strftime('%d'),
            'amount': float(running_total)
        })
    
    # Prepare data for comparison chart
    cumulative_comparison = {
        'current_month': {
            'name': selected_date.strftime('%B %Y'),
            'data': current_month_cumulative
        },
        'previous_month': {
            'name': previous_month_date.strftime('%B %Y'),
            'data': previous_month_cumulative
        }
    }
    
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
    income_transactions = Transaction.objects.filter(user=request.user, amount__gt=0).order_by('-date')
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
    current_date = datetime.now().replace(day=1)
    for i in range(11, -1, -1):
        month_date = current_date - relativedelta(months=i)
        month_labels.append(month_date.strftime('%b %Y'))
    
    # For each category, get monthly spending for last 12 months
    for category in visible_categories:
        monthly_amounts = []
        for i in range(11, -1, -1):
            month_date = current_date - relativedelta(months=i)
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

    # 7. Predictions for next month
    next_month_date = (datetime.now() + timedelta(days=31)).replace(day=1)
    next_month_name = next_month_date.strftime('%b %Y')
    
    # Calculate predictions for each category based on historical data
    predictions = []
    
    for category in visible_categories:
        if category.visible:
            # Get the last 3 months of data for this category to calculate trend
            recent_months_data = []
            for i in range(3, 0, -1):
                month_date = (datetime.now() - timedelta(days=30*i)).replace(day=1)
                month_expense = sum([
                    transaction.amount 
                    for transaction in transactions 
                    if transaction.category == category
                    and transaction.date.month == month_date.month 
                    and transaction.date.year == month_date.year
                ])
                recent_months_data.append(float(abs(month_expense)))
            
            # Only predict for categories with consistent spending
            if sum(recent_months_data) > 0:
                # Simple prediction based on weighted average of last 3 months
                # Most recent month has highest weight
                if len(recent_months_data) == 3:
                    predicted_amount = (recent_months_data[0] * 0.2 + 
                                       recent_months_data[1] * 0.3 + 
                                       recent_months_data[2] * 0.5)
                else:
                    # If we don't have 3 months of data, use average of available data
                    predicted_amount = sum(recent_months_data) / len(recent_months_data)
                
                # Add seasonal adjustment (if applicable)
                # Check if we have data from same month last year
                last_year_month = (next_month_date.replace(year=next_month_date.year-1))
                last_year_expense = sum([
                    transaction.amount 
                    for transaction in transactions 
                    if transaction.category == category
                    and transaction.date.month == last_year_month.month 
                    and transaction.date.year == last_year_month.year
                ])
                
                # If we have data from same month last year, factor it in (30% weight)
                if abs(last_year_expense) > 0:
                    predicted_amount = predicted_amount * 0.7 + float(abs(last_year_expense)) * 0.3
                
                # Round to 2 decimal places
                predicted_amount = round(predicted_amount, 2)
                
                predictions.append({
                    'category': str(category),
                    'predicted': predicted_amount,
                    'budget': float(category.budget),
                    'color': generateRandomColor()
                })
    
    # Sort by predicted amount (descending)
    predictions.sort(key=lambda x: x['predicted'], reverse=True)
    
    # Limit to top 10 categories
    predictions = predictions[:10]

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
        'month_labels': json.dumps(month_labels),
        'cumulative_comparison': json.dumps(cumulative_comparison, cls=DecimalEncoder),
        # Prediction data
        'predictions': json.dumps(predictions, cls=DecimalEncoder),
        'next_month_name': next_month_name
    }
    return render(request, 'transactions.html', context)

class TransactionListView(generics.ListCreateAPIView):
    serializer_class = TransactionSerializer
    authentication_classes = [APIKeyAuthentication]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Transaction.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

@api_view(['POST'])
@authentication_classes([APIKeyAuthentication])
@permission_classes([IsAuthenticated])
def create_transactions(request):
    if not isinstance(request.data, list):
        return Response({'error': 'Expected a list of transactions'}, status=status.HTTP_400_BAD_REQUEST)
    api_key = request.headers.get('X-API-Key') or request.query_params.get('api_key')
    user = APIKey.objects.get(key=api_key).user
    created_transactions = []
    new_transactions = []
    existing_transactions = []
    transaction_data_map = {}

    # Validate required fields in all transactions
    required_fields = ['id', 'date', 'description', 'amount']
    for transaction_data in request.data:
        missing_fields = [field for field in required_fields if field not in transaction_data]
        if missing_fields:
            return Response(
                {'error': f'Missing required fields: {", ".join(missing_fields)}'},
                status=status.HTTP_400_BAD_REQUEST
            )

    try:
        # Separate new and existing transactions
        existing_ids = set(Transaction.objects.filter(
            id__in=[t['id'] for t in request.data]
        ).values_list('id', flat=True))

        for transaction_data in request.data:
            transaction_data['user_id'] = user.id
            transaction_id = transaction_data['id']
            transaction_data_map[transaction_id] = transaction_data
            
            if transaction_id in existing_ids:
                existing_transactions.append(transaction_id)
            else:
                new_transactions.append(Transaction(
                    id=transaction_id,
                    user_id=user.id,
                    date=transaction_data['date'],
                    description=transaction_data['description'],
                    amount=transaction_data['amount'],
                    metadata=transaction_data.get('metadata'),
                ))

        # Create new transactions one by one to ensure save() method is called
        if new_transactions:
            for transaction in new_transactions:
                try:
                    transaction.save()
                    created_transactions.append({
                        'id': transaction.id,
                        'user': transaction.user_id,
                        'date': transaction.date,
                        'description': transaction.description,
                        'amount': transaction.amount,
                        'metadata': transaction.metadata,
                        'category': transaction.category.name if transaction.category else None
                    })
                except Exception as e:
                    print(f"Skipping duplicate transaction {transaction.id}: {str(e)}")
                    continue

        return Response({"created": created_transactions}, status=status.HTTP_201_CREATED)
    except Exception as e:
        return Response(
            {'error': f'Failed to process transactions: {str(e)}'},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR
        )

@api_view(('GET',))
@authentication_classes([APIKeyAuthentication])
@permission_classes([IsAuthenticated])
def category_tokens(request):
    categories = Category.objects.all()
    tokens = {}
    for category in categories:
        tokens[category.name] = dict(Counter((" ".join([t.description for t in category.transactions.filter(user=request.user).all()]).split(" "))).most_common())

    # json response 
    return Response(tokens)