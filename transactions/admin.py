from django.contrib import admin
from .models import *
from djangoql.admin import DjangoQLSearchMixin
from django.db.models import JSONField
from django_json_widget.widgets import JSONEditorWidget

class TransactionAdmin(DjangoQLSearchMixin, admin.ModelAdmin):
    list_display = ('date', 'description', 'amount', 'category')
    search_fields = ('date', 'description', 'amount')
    list_filter = ('date', 'category')
    list_editable = ('category',)
    autocomplete_fields = ('category',)
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

admin.site.register(Category, CategoryAdmin)
admin.site.register(Transaction, TransactionAdmin)



admin.site.register(Association)
