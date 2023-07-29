from django.test import TestCase
from shop.model import Category


class CategoryModelTestCase(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.category1 = Category.objects.create(name='Electronics')
        cls.category2 = Category.objects.create(name='Mobile', parent_category=cls.category1)
        cls.category3 = Category.objects.create(name='Accessories', parent_category=cls.category1)

    def test_category_name(self):
        self.assertEqual(self.category1.name, 'Electronics')
        self.assertEqual(self.category2.name, 'Mobile')
        self.assertEqual(self.category3.name, 'Accessories')

    def test_parent_category(self):
        self.assertIsNone(self.category1.parent_category)
        self.assertEqual(self.category2.parent_category, self.category1)
        self.assertEqual(self.category3.parent_category, self.category1)

    def test_db_table(self):
        self.assertEqual(Category._meta.db_table, 'shop_category')

    def test_str_method(self):
        self.assertEqual(str(self.category1), 'Electronics')
        self.assertEqual(str(self.category2), 'Mobile')
        self.assertEqual(str(self.category3), 'Accessories')

    def test_create_category_without_parent(self):
        category_count_before = Category.objects.count()
        new_category = Category.objects.create(name='New Category')
        category_count_after = Category.objects.count()
        self.assertEqual(category_count_after - category_count_before, 1)
        self.assertIsNone(new_category.parent_category)

    def test_create_category_with_parent(self):
        category_count_before = Category.objects.count()
        new_category = Category.objects.create(name='Child Category', parent_category=self.category1)
        category_count_after = Category.objects.count()
        self.assertEqual(category_count_after - category_count_before, 1)
        self.assertEqual(new_category.parent_category, self.category1)

    def test_update_category_name(self):
        updated_name = 'Updated Category'
        self.category1.name = updated_name
        self.category1.save()
        updated_category = Category.objects.get(id=self.category1.id)
        self.assertEqual(updated_category.name, updated_name)

    def test_delete_category(self):
        category_count_before = Category.objects.count()
        self.category1.delete()
        category_count_after = Category.objects.count()
        self.assertEqual(category_count_before - category_count_after, 1)
