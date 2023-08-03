from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.authentication import SessionAuthentication
from rest_framework.decorators import (authentication_classes,
                                       permission_classes)
from rest_framework_simplejwt.authentication import JWTAuthentication
from shop.model.category import Category
from rest_framework import mixins, status
from rest_framework import generics
from shop.serializer.category_serializer import CategorySerializer
from shop.utils import constants
from shop.utils.pagination_custom import CustomPaginationStyled
from shop.utils.response_custom import get_error_response
from rest_framework.permissions import IsAuthenticated


@authentication_classes([SessionAuthentication, JWTAuthentication])
@permission_classes([IsAuthenticated])
class CategoryList(mixins.ListModelMixin,
                   mixins.CreateModelMixin,
                   generics.GenericAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    pagination_class = CustomPaginationStyled
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ["name", "parent_category"]

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
class CategoryDetail(mixins.RetrieveModelMixin,
                     mixins.UpdateModelMixin,
                     mixins.DestroyModelMixin,
                     generics.GenericAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def put(self, request, *args, **kwargs):
        return self.update(request, *args, **kwargs)

    def delete(self, request, *args, **kwargs):
        return self.destroy(request, *args, **kwargs)
