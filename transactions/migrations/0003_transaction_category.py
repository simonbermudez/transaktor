# Generated by Django 5.0.6 on 2024-06-07 12:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('transactions', '0002_alter_transaction_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='transaction',
            name='category',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
