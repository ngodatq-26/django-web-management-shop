# Generated by Django 4.2.3 on 2023-07-27 07:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('parent_category', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.category')),
            ],
            options={
                'db_table': 'shop_category',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('price', models.FloatField(max_length=20)),
                ('quantity', models.IntegerField()),
                ('image', models.ImageField(upload_to='images/')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.category')),
            ],
            options={
                'db_table': 'shop_product',
            },
        ),
    ]