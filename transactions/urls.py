from django.urls import path
from .views import *

urlpatterns = [
    path('transactions/upload/', create_transactions, name='create_transactions'),
    path('transfers/upload/', create_transfers, name='create_transfers'),
    path('category_tokens/', category_tokens, name='category_tokens'),
    path('', transactions, name='home'),
]