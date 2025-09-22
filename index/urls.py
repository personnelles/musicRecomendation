from django.urls import path

from users.views import change_password
from . import views

app_name = 'index'
urlpatterns = [
    path('', views.index, name='home'),
    path('collect_song/<int:song_id>', views.collect_song, name='collect_song'),
    path('getAllCollections/', views.get_collections, name='get_collections'),
    path('play_song/<int:song_id>', views.add_play_count, name='add_play_count'),
    path('get_song_by_id/<int:song_id>', views.get_song_by_id, name='get_song_by_id'),
    path('play_history/', views.play_history, name='play_history'),
    path('cover/<int:song_id>', views.mp3_img_by_id, name='cover'),
    path('score/<int:song_id>', views.score, name='score'),
    path('recommend', views.recommend, name='recommend'),
]

