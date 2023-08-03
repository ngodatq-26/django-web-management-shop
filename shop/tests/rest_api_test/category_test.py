from django.contrib.auth.models import User
from rest_framework.test import APITestCase
from rest_framework import status
from shop.model import Category


class CategoryTests(APITestCase):

    def setUp(self):
        self.user = User.objects.create_superuser(
            username='testuser', password='testpassword')
        self.client.force_authenticate(user=self.user)

    def test_create_category(self):
        category_data = {'name': 'Test Category', 'parent_category': None}
        response = self.client.post(
            '/api/categories/',
            category_data,
            format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Category.objects.count(), 1)
        self.assertEqual(Category.objects.get().name, 'Test Category')

    def test_update_category(self):
        category = Category.objects.create(name='Old Category')
        new_category_data = {'name': 'New Category', 'parent_category': None}
        response = self.client.put(
            f'/api/categories/{category.id}/',
            new_category_data,
            format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], 'New Category')

    def test_delete_category(self):
        category = Category.objects.create(name='Category to Delete')
        response = self.client.delete(
            f'/api/categories/{category.id}/', format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_list_categories(self):
        Category.objects.create(name='Category 1')
        Category.objects.create(name='Category 2')
        Category.objects.create(name='Category 3')

        response = self.client.get('/api/categories/', format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 5)

    def test_retrieve_category(self):
        category = Category.objects.create(name='Test Category')
        response = self.client.get(
            f'/api/categories/{category.id}/',
            format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], 'Test Category')
