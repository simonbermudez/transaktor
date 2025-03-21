from rest_framework import serializers
from .models import Transaction, User, APIKey

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']

class APIKeySerializer(serializers.ModelSerializer):
    class Meta:
        model = APIKey
        fields = ['key', 'name', 'created_at', 'last_used_at', 'is_active']
        read_only_fields = ['key', 'created_at', 'last_used_at']

class TransactionSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = Transaction
        fields = ['id', 'user', 'date', 'description', 'amount', 'category', 'metadata']
        read_only_fields = ['user']