# Django Web Management Shop

Django Web Management Shop is a web application built with Django that allows you to manage products and categories in an online shop. It provides a user-friendly interface to add, edit, and delete products, as well as organize them into categories.

## Installation

1. Clone the repository:

```bash
git clone https://github.com/ngodatq-26/django-web-management-shop.git

cd django-web-management-shop
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`


Usage
Admin Interface
To access the admin interface, go to http://127.0.0.1:8000/admin/ and log in with the superuser account you created earlier. In the admin interface, you can manage products and categories by adding, modifying, and deleting them.

API Endpoints
The app also provides API endpoints for interacting with products and categories programmatically. The API endpoints include:

List all products: GET /api/products/
Create a new product: POST /api/products/
Get details of a product: GET /api/products/<product_id>/
Update a product: PUT /api/products/<product_id>/
Delete a product: DELETE /api/products/<product_id>/
List all categories: GET /api/categories/
Create a new category: POST /api/categories/
Get details of a category: GET /api/categories/<category_id>/
Update a category: PUT /api/categories/<category_id>/
Delete a category: DELETE /api/categories/<category_id>/
Frontend Interface
The app also includes a basic frontend interface for viewing and managing products and categories. You can access the frontend interface at http://127.0.0.1:8000/.

Contribution
All contributions are welcome! If you find any issues or want to add new features, please feel free to submit a pull request.

License
This project is licensed under the MIT License - see the LICENSE file for details.
