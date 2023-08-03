from rest_framework import serializers
from shop.model.category import Category


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ["id", "name", "parent_category"]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        parent_category = instance.parent_category
        if parent_category:
            data["parent_category"] = parent_category.name
        else:
            data["parent_category"] = None
        return data

    def create(self, validated_data):
        return Category.objects.create(**validated_data)

    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.parent_category = validated_data.get('parent_category',
                                                      instance.parent_category)
        instance.save()
        return instance
