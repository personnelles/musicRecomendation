from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from django.urls import re_path
from django.views.static import serve
from users import views

app_name = 'my_users'
urlpatterns = [
    path('register/', views.register, name='register'),
    path('', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'),
    path('change-password/', views.change_password, name='change_password'),
    path('profile/', views.get_profile, name='profile'),
    path('user_edit/', views.user_edit, name='user_edit'),

    re_path(r'^favicon.ico$', serve, {'path': 'favicon.ico', 'document_root': settings.STATIC_ROOT}),

] + static(settings.MEDIA_URL, document_root=settings.STATIC_ROOT)


if not settings.DEBUG:
    urlpatterns += [re_path(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT})]
