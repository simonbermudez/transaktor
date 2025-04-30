from django.contrib import admin
from django.urls import path, include

admin.site.site_header = "Transaktor"
admin.site.site_title = "Transaktor Admin Portal"
admin.site.index_title = "Welcome to Transaktor Portal"
admin.site.site_url = "/"

urlpatterns = [
    path('admin/', include('massadmin.urls')),
    path('admin/', admin.site.urls),
    path('', include('transactions.urls')),
]