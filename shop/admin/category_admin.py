from django.contrib import admin
from shop.model.category import Category
from shop.model.product import Product
from django.db.models import Count
from django import forms
from shop.utils import constants


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ["name", "parent_category", "product_count"]
    fields = ["name", "parent_category", "product_count"]
    readonly_fields = ["product_count"]
    search_fields = ["name", "parent_category__name"]
    list_per_page = constants.DEFAULT_PAGE_SIZE

    @admin.display(empty_value="0")
    def product_count(self, obj):
        return Product.objects.filter(category=obj.id).count()
