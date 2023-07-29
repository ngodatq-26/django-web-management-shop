from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser
from rest_framework.response import Response
from rest_framework import status
from ShopManagementWeb import settings


class UploadFileView(APIView):
    parser_classes = [MultiPartParser]

    def post(self, request, *args, **kwargs):
        up_file = request.data.get('file')
        file_save = settings.MEDIA_URL + settings.FOLDER_SAVE_IMAGE_CART + up_file.name
        if up_file is not None:
            destination = open(file_save, 'wb+')
            for chunk in up_file.chunks():
                destination.write(chunk)
            destination.close()
            return Response({
                "url": file_save
            }, status=status.HTTP_201_CREATED)
        else:
            return Response({'detail': 'No file was provided.'}, status=status.HTTP_400_BAD_REQUEST)