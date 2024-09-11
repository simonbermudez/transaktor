from django.contrib import admin
from .models import *
from djangoql.admin import DjangoQLSearchMixin


class TransactionAdmin(DjangoQLSearchMixin, admin.ModelAdmin):
    list_display = ('date', 'description', 'amount', 'category')
    search_fields = ('date', 'description', 'amount')
    list_filter = ('date', 'category')
    list_editable = ('category',)
    autocomplete_fields = ('category',)

class CategoryAdmin(DjangoQLSearchMixin, admin.ModelAdmin):
    list_display = ('name', 'budget')
    search_fields = ('name', 'budget')
    list_editable = ('budget',)
    list_filter = ('budget', )
    search_fields = ('name',)

admin.site.register(Category, CategoryAdmin)
admin.site.register(Transaction, TransactionAdmin)



admin.site.register(Association)
