from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed
from django.utils import timezone
from .models import APIKey

class APIKeyAuthentication(BaseAuthentication):
    def authenticate(self, request):
        api_key = request.META.get('X-API-Key') or request.query_params.get('api_key')
        if not api_key:
            return None

        try:
            api_key_obj = APIKey.objects.get(key=api_key, is_active=True)
            api_key_obj.last_used_at = timezone.now()
            api_key_obj.save()
            return (api_key_obj.user, api_key_obj)
        except (APIKey.DoesNotExist, ValueError):
            raise AuthenticationFailed('Invalid API key')