"""
URL configuration for ShopManagementWeb project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path
from ShopManagementWeb import settings
from shop.view import product_view, category_view, file_view
from django.urls import include
from rest_framework_simplejwt.views import (TokenObtainPairView,
                                            TokenRefreshView, TokenVerifyView)


handler404 = 'shop.view.utils.error_view.custom_page_not_found_view'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-auth/',
         include('rest_framework.urls', namespace='rest_framework')),
    path('api/products/',
         product_view.ProductList.as_view(), name='product-list'),
    path('api/products/<int:pk>',
         product_view.ProductDetail.as_view(), name='product-detail'),
    path('api/categories/',
         category_view.CategoryList.as_view()),
    path('api/categories/<int:pk>',
         category_view.CategoryDetail.as_view()),
    path('api/token/',
         TokenObtainPairView.as_view(),
         name='token_obtain_pair'),
    path('api/token/refresh/',
         TokenRefreshView.as_view(),
         name='token_refresh'),
    path('api/token/verify/',
         TokenVerifyView.as_view(),
         name='token_verify'),
    path('api/upload/',
         file_view.UploadFileView.as_view(),
         name="upload_file")
]


urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
