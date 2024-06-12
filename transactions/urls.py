from django.urls import path
from .views import *

urlpatterns = [
    path('transactions/upload/', create_transactions, name='create_transactions'),
    path('transactions/', TransactionListView.as_view(), name='list_transactions'),
    path('', transactions, name='home'),
]