from django.contrib import admin
from shop.model import Product
from django.utils.html import format_html
from django import forms
from django.utils.translation import gettext_lazy
from shop.utils import constants


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ["name", "price", "category", "quantity", "image"]


class ProductQuantityFilter(admin.SimpleListFilter):
    title = "quantity"
    parameter_name = "quantity"

    def lookups(self, request, model_admin):
        return [
            ("1", gettext_lazy("1-10")),
            ("2", gettext_lazy("11-20")),
            ("3", gettext_lazy(">20"))
        ]

    def queryset(self, request, queryset):
        if self.value() == "1":
            return queryset.filter(quantity__gte=1, quantity__lte=10)
        if self.value() == "2":
            return queryset.filter(quantity__gte=11, quantity__lte=20)
        if self.value() == "3":
            return queryset.filter(quantity__gte=21)
        return queryset


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    form = ProductForm
    list_display = ["name", "price", "category", "quantity", "image_preview"]
    list_filter = [ProductQuantityFilter]
    list_per_page = constants.DEFAULT_PAGE_SIZE

    @admin.display(empty_value="???")
    def image_preview(self, obj):
        return format_html('<img src = "{}" width = 100 height = 100/>', obj.image)

    search_fields = ["name", "category__name"]
