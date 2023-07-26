from rest_framework import serializers
from shop.model.category import Category


class CategorySerializer(serializers.Serializer):
    name = serializers.CharField(required=True, max_length=100)
    parent_category = serializers.PrimaryKeyRelatedField(queryset=Category.objects.all(), allow_null=True, allow_empty=True)

    def create(self, validated_data):
        return Category.objects.create(**validated_data)

    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.parent_category = validated_data.get('parent_category', instance.parent_category)
        instance.save()
        return instance
