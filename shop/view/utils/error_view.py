from django.shortcuts import render


# custom 404 view
def custom_page_not_found_view(request, exception):
    return render(request, "404.html", {})
