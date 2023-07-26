from rest_framework.response import Response


class CustomResponse:
    def __init__(self, status_code, message, data):
        self.status_code = status_code
        self.message = message
        self.data = data

    def get_response(self) -> Response:
        return Response({
            "status_code": self.status_code,
            "message": self.message,
            "data": self.data
        }, status=self.status_code)


def get_error_response(status_code, detail):
    return Response({"detail": detail}, status=status_code)
