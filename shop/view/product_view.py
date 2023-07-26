from rest_framework.authentication import SessionAuthentication
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.decorators import authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated

from shop.model import Category
from shop.model import Product
from shop.serializer.product_serializer import ProductSerializer
from django import http
from rest_framework.views import APIView
from rest_framework.response import Response
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

    def get(self, request, *args, **kwargs):
        page_size = int(request.GET.get('page_size', constants.DEFAULT_PAGE_SIZE))
        if page_size <= 0:
            return get_error_response(status.HTTP_400_BAD_REQUEST, constants.ERROR_PAGE_SIZE_MESSAGE)
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