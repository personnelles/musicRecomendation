from django.core.paginator import Paginator
from django.http import JsonResponse
from django.shortcuts import render
from django.db.models import Q, F, OuterRef, Case, When, Exists, Value, BooleanField, Subquery
from index.models import Song
import re
from django.db import models
from users.models import UserCollectionSong, UserScoreOnSong
from index.views import get_song


# 避免用户输入正则表达式的特殊符号，如*, |, (, ), [, ], -
def regex_escape(val):
    if not isinstance(val, str):
        val = str(val)
    return re.escape(val)



def search_song(request):
    if request.method == 'GET':
        qqq_value = request.GET.get('q')
        qqq_value = regex_escape(qqq_value)
        songs = get_song(request.user)
        songs = songs.filter(Q(name__icontains=qqq_value) | Q(artist__icontains=qqq_value))
        paginator = Paginator(songs, 10)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        print(page_obj)
        context = {
            'page_obj': page_obj,
        }
        return render(request, 'search/search.html', context)
    else:
        return JsonResponse({'status': 'error', 'code': 403})
