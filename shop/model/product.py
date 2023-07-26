from django.db import models
from shop.model.category import Category


class Product(models.Model):
    name = models.CharField(max_length=100)
    price = models.FloatField(max_length=20)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    image = models.CharField(max_length=255)

    class Meta:
        db_table = 'shop_product'
