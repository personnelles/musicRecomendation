from django.urls import path

from users.views import change_password
from . import views

app_name = 'search'
urlpatterns = [
    path('', views.search_song, name='search'),
]
