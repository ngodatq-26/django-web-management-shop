from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.authentication import SessionAuthentication
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.decorators import (authentication_classes,
                                       permission_classes)
from rest_framework.permissions import IsAuthenticated
from shop.model import Product
from shop.serializer.product_serializer import ProductSerializer
from rest_framework import status
from rest_framework import mixins
from rest_framework import generics
from shop.utils import pagination_custom
from shop.utils import constants
from shop.utils.response_custom import get_error_response


@authentication_classes([SessionAuthentication, JWTAuthentication])
@permission_classes([IsAuthenticated])
class ProductList(mixins.ListModelMixin,
                  mixins.CreateModelMixin,
                  generics.GenericAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    pagination_class = pagination_custom.CustomPaginationStyled

    def get_queryset(self):
        queryset = Product.objects.all()
        name = self.request.query_params.get('name')
        quantity_min = self.request.query_params.get('quantity_min')
        quantity_max = self.request.query_params.get('quantity_max')
        price_min = self.request.query_params.get('price_min')
        price_max = self.request.query_params.get('price_max')
        category = self.request.query_params.get('category')
        if name is not None:
            queryset = queryset.filter(name=name)
        if quantity_min is not None:
            queryset = queryset.filter(quantity__gte=quantity_min)
        if quantity_max is not None:
            queryset = queryset.filter(quantity__lte=quantity_max)
        if price_min is not None:
            queryset = queryset.filter(quantity__gte=price_min)
        if price_max is not None:
            queryset = queryset.filter(quantity__lte=price_max)
        if category is not None:
            queryset = queryset.filter(category=category)
        return queryset

    def get(self, request, *args, **kwargs):
        page_size = int(request.GET.get('page_size',
                                        constants.DEFAULT_PAGE_SIZE))
        if page_size <= 0:
            return get_error_response(status.HTTP_400_BAD_REQUEST,
                                      constants.ERROR_PAGE_SIZE)
        self.pagination_class.page_size = page_size
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)


@authentication_classes([SessionAuthentication, JWTAuthentication])
@permission_classes([IsAuthenticated])
class ProductDetail(mixins.RetrieveModelMixin,
                    mixins.UpdateModelMixin,
                    mixins.DestroyModelMixin,
                    generics.GenericAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)
