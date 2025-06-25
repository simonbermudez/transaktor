from django.contrib import admin
from .models import *
from djangoql.admin import DjangoQLSearchMixin
from django.db.models import JSONField
from django_json_widget.widgets import JSONEditorWidget
from django.contrib import admin
from django.contrib import messages
from django.db.models import Sum 
from django.contrib.admin import SimpleListFilter

@admin.action(description='Remove duplicates (keeps first entry)')
def remove_duplicates(modeladmin, request, queryset=None):
    deleted_count = Transaction.remove_duplicates()
    messages.success(request, f'Successfully removed {deleted_count} duplicate entries.')

@admin.action(description='Remove old pending transactions')
def remove_old_pending_transactions(modeladmin, request, queryset=None):
    transactions = Transaction.remove_old_pending_transactions()
    messages.success(request, f'Successfully removed {", ".join([str(transaction) for transaction in transactions])} old pending transactions. Total: {transactions.count()} Total balance deleted: {transactions.aggregate(Sum("amount"))["amount__sum"]}')

class CategoryListFilter(SimpleListFilter):
    title = 'category'
    parameter_name = 'category'

    def lookups(self, request, model_admin):
        categories = Category.objects.order_by('name')
        choices = [(c.name, c.name) for c in categories]
        choices.insert(0, ('None', 'No Category'))
        return choices

    def queryset(self, request, queryset):
        if self.value() == 'None':
            return queryset.filter(category__isnull=True)
        elif self.value():
            return queryset.filter(category=self.value())
        return queryset

class TransactionAdmin(DjangoQLSearchMixin, admin.ModelAdmin):
    list_display = ('date', 'description', 'amount', 'category')
    search_fields = ('date', 'description', 'amount')
    list_filter = ('date', CategoryListFilter)
    list_editable = ('category',)
    autocomplete_fields = ('category',)
    ordering = ('-date',)
    actions = [remove_duplicates, remove_old_pending_transactions]
    allow_empty_actions = True

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "category":
            kwargs["queryset"] = Category.objects.order_by('name')
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    formfield_overrides = {
        JSONField: {'widget': JSONEditorWidget},
    }

class TransferAdmin(DjangoQLSearchMixin, admin.ModelAdmin):
    list_display = ('date', 'description', 'amount', 'transaction')
    search_fields = ('date', 'description', 'amount')
    list_filter = ('date',)
    ordering = ('-date',)

    formfield_overrides = {
        JSONField: {'widget': JSONEditorWidget},
    }

class CategoryAdmin(DjangoQLSearchMixin, admin.ModelAdmin):
    list_display = ('name', 'visible', 'budget')
    search_fields = ('name', 'budget')
    list_editable = ('budget', 'visible')
    list_filter = ('budget', )
    search_fields = ('name',)

class APIKeyAdmin(admin.ModelAdmin):
    list_display = ('name', 'user', 'key', 'created_at', 'last_used_at', 'is_active')
    list_filter = ('is_active', 'created_at', 'last_used_at')
    search_fields = ('name', 'user__username', 'key')
    readonly_fields = ('key', 'created_at', 'last_used_at')
    ordering = ('-created_at',)

admin.site.register(Category, CategoryAdmin)
admin.site.register(Transaction, TransactionAdmin)
admin.site.register(Transfer, TransferAdmin)
admin.site.register(APIKey, APIKeyAdmin)
admin.site.register(Association)
