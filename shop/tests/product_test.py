from django.test import TestCase
from shop.model import Product, Category
from django.core.files.uploadedfile import SimpleUploadedFile


class ProductModelTestCase(TestCase):
    def setUp(self):
        self.category = Category.objects.create(name='Electronics')
        self.product = Product.objects.create(
            name='Smartphone',
            price=1000.0,
            category=self.category,
            quantity=10,
            image=SimpleUploadedFile(
                name='test_image.jpg',
                content=open('images_test/logo.png', 'rb').read(),
                content_type='image/jpeg'
            )
        )

    def test_product_attributes(self):
        self.assertEqual(self.product.name, 'Smartphone')
        self.assertEqual(self.product.price, 1000.0)
        self.assertEqual(self.product.category, self.category)
        self.assertEqual(self.product.quantity, 10)

    def test_photo_admin_method_with_image(self):
        photo_html = self.product.photo_admin()
        self.assertIn('<img', photo_html)
        self.assertIn('src="', photo_html)
        self.assertIn('width="100"', photo_html)
        self.assertIn('height="100"', photo_html)

    def test_photo_admin_method_without_image(self):
        self.product.image = None
        self.product.save()
        self.assertEqual(self.product.photo_admin(), "No image")

    def test_price_min_value_validator(self):
        with self.assertRaises(Exception):
            Product.objects.create(
                name='Laptop',
                price=-500.0,
                category=self.category,
                quantity=5
            )

    def test_quantity_min_value_validator(self):
        with self.assertRaises(Exception):
            Product.objects.create(
                name='Tablet',
                price=800.0,
                category=self.category,
                quantity=-1
            )

    def test_db_table(self):
        self.assertEqual(Product._meta.db_table, 'shop_product')
