from rest_framework import serializers
from shop.model import Product
from shop.model import Category
from rest_framework.pagination import LimitOffsetPagination


class ProductSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(required=True, allow_blank=True, max_length=100)
    price = serializers.IntegerField(required=True, min_value=0)
    quantity = serializers.FloatField(required=True, min_value=0, max_value=20)
    category = serializers.PrimaryKeyRelatedField(queryset=Category.objects.all())

    def create(self, validated_data):
        return Product.objects.create(**validated_data)

    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.price = validated_data.get('price', instance.price)
        instance.quantity = validated_data.get('quantity', instance.quantity)
        instance.category = validated_data.get('category', instance.category)
        instance.save()
        return instance



