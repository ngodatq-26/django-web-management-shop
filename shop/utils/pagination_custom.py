from rest_framework.pagination import PageNumberPagination, LimitOffsetPagination
from rest_framework.response import Response


class CustomPaginationStyled(PageNumberPagination):

    def create_custom(self, page_size, max_page_size, page_size_query_param):
        self.page_size = page_size
        self.max_page_size = max_page_size
        self.page_size_query_param = page_size_query_param

    def get_paginated_response(self, data):
        return Response({
            "total": self.page.paginator.count,
            "page": self.page.number,
            "page_size": self.page_size,
            "links": {
                "next_link": self.get_next_link(),
                "previous_link": self.get_previous_link()
            },
            "results": data
        })
