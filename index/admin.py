from django.contrib import admin
from django.contrib.admin import SimpleListFilter

from index.models import Song, Dynamic
from users.models import UserCollectionSong, PlayHistory, UserScoreOnSong


# Register your models here.


@admin.register(Song)
class SongAdmin(admin.ModelAdmin):
    list_per_page = 50
    list_display = ('id', 'name', 'artist', 'pop', 'create_at', 'file_path')
    search_fields = ('name', 'artist')
    list_display_links = ('name',)
    list_filter = ('pop', 'artist', 'name')
    ordering = ('id',)


@admin.register(UserCollectionSong)
class UserCollectionSongAdmin(admin.ModelAdmin):
    list_display = ('user', 'song', 'collect_at')
    list_per_page = 50
    search_fields = ('user__username', 'song__name')
    list_display_links = ('song',)


@admin.register(PlayHistory)
class PlayHistoryAdmin(admin.ModelAdmin):
    list_display = ('user', 'song', 'play_count')
    search_fields = ('user__username','song__name', 'play_count')
    list_per_page = 50
    list_display_links = ('song',)






@admin.register(UserScoreOnSong)
class UserScoreOnSongAdmin(admin.ModelAdmin):
    list_per_page = 50
    list_display = ('user', 'song', 'score')
    search_fields = ('song__name', 'user__username')
    list_display_links = ('song', 'user')


# admin.py
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User


class CustomUserAdmin(UserAdmin):
    list_display = (
    'username', 'email', 'first_name', 'last_name', 'is_active', 'is_superuser', 'is_staff', 'date_joined')
    list_filter = ('is_active', 'is_staff', 'is_superuser')
    search_fields = ('username', 'email', 'first_name', 'last_name')
    list_per_page = 50

    # 为is_active字段添加更友好的显示
    def get_list_display(self, request):
        list_display = super().get_list_display(request)
        # 可以添加自定义的显示方法
        if 'is_active' in list_display:
            list_display = list(list_display)
            list_display.remove('is_active')
            list_display.append('active_status')
        return list_display

    def active_status(self, obj):
        return '活跃' if obj.is_active else '禁用'

    active_status.short_description = '活跃状态'
    active_status.allow_tags = True

    list_filter = ('is_active',)


admin.site.unregister(User)

admin.site.register(User, CustomUserAdmin)
