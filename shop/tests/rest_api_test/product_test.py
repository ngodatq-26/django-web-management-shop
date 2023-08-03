from django.contrib.auth.models import User
from django.core.files.uploadedfile import SimpleUploadedFile
from rest_framework import status
from rest_framework.test import APITestCase
from django.urls import reverse
from shop.model import Product, Category


class ProductTests(APITestCase):

    def setUp(self):
        category = Category.objects.create(name='Test Category')
        self.user = User.objects.create_superuser(
            username='testuser', password='testpassword')
        self.product_data = {
            'name': 'Test Product',
            'price': 100,
            'quantity': 100,
            'category': category}
        self.product = Product.objects.create(**self.product_data)
        self.list_url = reverse('product-list')
        self.detail_url = reverse('product-detail', args=[self.product.id])

    def test_list_products(self):
        self.client.force_authenticate(user=self.user)
        response = self.client.get(self.list_url, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 5)

    def test_retrieve_product(self):
        self.client.force_authenticate(user=self.user)
        response = self.client.get(self.detail_url, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], self.product_data['name'])
        self.assertEqual(response.data['price'], self.product_data['price'])
        self.assertEqual(
            response.data['quantity'],
            self.product_data['quantity'])

    def test_create_product(self):
        self.client.force_authenticate(user=self.user)
        category = Category.objects.create(name='Test Category')
        image_file = SimpleUploadedFile(
            "test.png", b"file_content", content_type="image/png")
        new_product_data = {
            'name': 'Test Product',
            'price': 100,
            'quantity': 100,
            'category': category,
            'image': image_file}
        self.client.post(
            self.list_url,
            new_product_data,
            format='multipart')

        self.assertEqual(Product.objects.count(), 1)
        self.assertEqual(Product.objects.last().name, new_product_data['name'])

    def test_update_product(self):
        self.client.force_authenticate(user=self.user)
        category = Category.objects.create(name='Test Category')
        image_file = SimpleUploadedFile(
            "test.png", b"file_content", content_type="image/png")
        updated_product_data = {
            'name': 'Test Product',
            'price': 100,
            'quantity': 100,
            'category': category,
            'image': image_file}
        self.client.put(
            self.detail_url,
            updated_product_data,
            format='multipart')

        self.assertEqual(
            Product.objects.get(
                id=self.product.id).name,
            updated_product_data['name'])

    def test_delete_product(self):
        self.client.force_authenticate(user=self.user)
        response = self.client.delete(self.detail_url, format='json')

        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Product.objects.count(), 0)
