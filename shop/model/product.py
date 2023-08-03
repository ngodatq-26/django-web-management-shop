from django.db import models
from shop.model.category import Category
from ShopManagementWeb import settings
from django.utils.html import format_html
from django.core.validators import MinValueValidator


class Product(models.Model):
    name = models.CharField(max_length=100)
    price = models.FloatField(max_length=20, default=0, validators=[
        MinValueValidator(0)
    ])
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=0, validators=[
        MinValueValidator(0)
    ])
    image = models.ImageField(upload_to=settings.FOLDER_SAVE_IMAGE_CART)

    def photo_admin(self):
        if self.image:
            return format_html(
                '<img id="photo-admin-preview" src="{}" ' +
                'width="100" height="100"/>',
                self.image.url
            )
        else:
            return "No image"

    def category_name(self):
        return self.category.name

    class Meta:
        db_table = 'shop_product'
