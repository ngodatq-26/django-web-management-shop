from django.contrib import admin
from shop.model import Product
from django.utils.translation import gettext_lazy
from shop.utils import constants


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
    fields = ["name", "price", "category", "quantity", "image", "photo_admin"]
    list_display = ["_name", "_price", "_category", "_quantity", "photo_admin"]
    list_filter = [ProductQuantityFilter]
    list_per_page = constants.DEFAULT_PAGE_SIZE
    ordering = ["price"]

    @admin.display(empty_value='0', ordering="price")
    def _price(self, obj):
        return "${:,.2f}".format(obj.price).rstrip('0').rstrip('.')

    @admin.display(empty_value="???", ordering="name")
    def _name(self, obj):
        return obj.name

    @admin.display(empty_value="???", ordering="category")
    def _category(self, obj):
        return obj.category

    @admin.display(empty_value="0", ordering="quantity")
    def _quantity(self, obj):
        return obj.quantity

    readonly_fields = ["photo_admin"]
    search_fields = ["name", "category__name"]
