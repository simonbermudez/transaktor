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
        return [(c.name, c.name) for c in categories]

    def queryset(self, request, queryset):
        if self.value():
            return queryset.filter(category_id=self.value())
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

class CategoryAdmin(DjangoQLSearchMixin, admin.ModelAdmin):
    list_display = ('name', 'visible', 'budget')
    search_fields = ('name', 'budget')
    list_editable = ('budget', 'visible')
    list_filter = ('budget', )
    search_fields = ('name',)

admin.site.register(Category, CategoryAdmin)
admin.site.register(Transaction, TransactionAdmin)



admin.site.register(Association)
