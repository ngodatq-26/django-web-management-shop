# Django Web Management Shop

Django Web Management Shop is a web application built with Django that allows you to manage products and categories in an online shop. It provides a user-friendly interface to add, edit, and delete products, as well as organize them into categories.

## Installation

1. Clone the repository:

```bash
git clone https://github.com/ngodatq-26/django-web-management-shop.git

cd django-web-management-shop
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
```
2.Create a virtual environment and activate it:
```bash
cd django-web-management-shop
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
```
3.Perform the migrations:
```bash
python manage.py makemigrations shop
python manage.py migrate
```
4.Create a superuser to access the admin interface:
```bash
python manage.py createsuperuser
```
5.Start the development server:
```bash
python manage.py runserver
```

## Usage
Admin Interface
To access the admin interface, go to http://127.0.0.1:8000/admin/ and log in with the superuser account you created earlier. In the admin interface, you can manage products and categories by adding, modifying, and deleting them.

### API Endpoints
The app also provides API endpoints for interacting with products and categories programmatically. The API endpoints include: </br>

List all products: GET /api/products/ </br>
Create a new product: POST /api/products/ </br>
Get details of a product: GET /api/products/<product_id>/ </br>
Update a product: PUT /api/products/<product_id>/ </br>
Delete a product: DELETE /api/products/<product_id>/ </br>
List all categories: GET /api/categories/ </br>
Create a new category: POST /api/categories/ </br>
Get details of a category: GET /api/categories/<category_id>/ </br>
Update a category: PUT /api/categories/<category_id>/ </br>
Delete a category: DELETE /api/categories/<category_id>/ </br>
### Frontend Interface
The app also includes a basic frontend interface for viewing and managing products and categories. You can access the frontend interface at http://127.0.0.1:8000/.
