import base64
import collections as ctl
import functools as ftl
import json
import re
from collections import defaultdict
from typing import Tuple, Any

import django.db.models as dm
import numpy as np
import pandas as pd
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.paginator import Paginator
from django.db import models
from django.db.models import Case, When, Exists, Value, BooleanField, QuerySet, Q
from django.db.models import F
from django.db.models import OuterRef, Subquery
from django.db.models.functions import Coalesce
from django.http import JsonResponse
from django.http import StreamingHttpResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_protect
from mutagen.id3 import ID3, APIC
from mutagen.mp3 import MP3

from index.models import Song, Dynamic
from musicRecommendatiion.settings import MEDIA_ROOT
from users.models import PlayHistory
from users.models import UserCollectionSong, UserScoreOnSong


@csrf_protect
@login_required(login_url='/')
def mp3_img_by_id(request, song_id):
    song = Song.objects.get(pk=song_id)
    file_path = str(MEDIA_ROOT / song.file_path.path)
    audio = MP3(file_path, ID3=ID3)

    album = audio.tags.get("TALB", ["未知专辑"])[0]

    for tag in audio.tags.items():
        if isinstance(tag[1], APIC):  # 获取APIC帧中的图片数据
            image_data = tag[1].data
            # 将图片数据编码为Base64
            encoded_image = base64.b64encode(image_data).decode("utf-8")
            return JsonResponse({
                "image": encoded_image,
                "album": album,
            })
    return JsonResponse({"error": "未找到嵌入图片！"})


def regex_escape(val) -> str:
    if not isinstance(val, str):
        val = str(val)
    return re.escape(val)


def get_song(user):
    collected_songs = (UserCollectionSong.objects.filter(user=user, song=OuterRef('pk'))
                       .values('song_id'))

    dynamic_info = Dynamic.objects.filter(song=OuterRef('pk'))

    # 打分的歌曲
    scored_songs = UserScoreOnSong.objects.filter(user=user, song=OuterRef('pk')).values('score')

    play_history_ = (PlayHistory.objects
                     .filter(user=user, song=OuterRef('pk'))
                     .values('play_count'))

    songs = Song.objects.annotate(
        user_id=Value(user.id),
        is_collected=Case(
            When(Exists(collected_songs), then=Value(True)),
            default=Value(False),
            output_field=BooleanField()
        ),
        score=Subquery(scored_songs, output_field=models.IntegerField()),

        total_play_count=Coalesce(Subquery(dynamic_info.values('total_play_count')[:1]),
                                  Value(0)),
        user_play_count=Coalesce(Subquery(play_history_, output_field=models.IntegerField()), Value(0)),
        collect_count=Coalesce(
            Subquery(dynamic_info.values('collect_count')[:1]),
            Value(0))
    ).values('id', 'user_id', 'name', 'artist', 'file_path', 'list_labels', 'is_collected', 'score',
             'user_play_count', 'total_play_count', 'collect_count').order_by('id')

    return songs


@csrf_protect
@login_required(login_url='/')
def index(request):
    user = request.user
    songs = get_song(user)
    tag = request.GET.get('tag')

    if tag:
        songs = songs.filter(list_labels__icontains=tag)
    paginator = Paginator(songs, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'index/index.html', {'page_obj': page_obj,
                                                'pos': 'index'})


@csrf_protect
@login_required(login_url='/')
def collect_song(request, song_id):
    json.loads(request.body.decode('utf-8'))
    coll = UserCollectionSong.objects.filter(user=request.user, song_id=song_id)

    if coll.exists():
        coll.delete()
        return JsonResponse({'success': True, 'message': '取消收藏',
                             'is_collected': False,
                             'text': '收藏'})
    else:
        UserCollectionSong(user=request.user, song_id=song_id).save()
        return JsonResponse({'success': True, 'message': '收藏成功', 'is_collected': True,
                             'text': '取消收藏'})


@csrf_protect
@login_required(login_url='/')
def get_collections(request):
    songs = get_song(request.user)
    tag = request.GET.get('tag')
    songs = songs.filter(is_collected=True).order_by('id')

    if tag:
        songs = songs.filter(list_labels__icontains=tag)
    paginator = Paginator(songs, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
        'songs': page_obj,
        'pos': 'collection'}
    return render(request, 'users/collections.html', context)


@csrf_protect
@login_required(login_url='/')
def add_play_count(request, song_id):
    song = Song.objects.filter(id=song_id)
    if not song.exists():
        return JsonResponse({'success': False, 'message': '歌曲不存在'})
    res, created = PlayHistory.objects.get_or_create(
        user=request.user,
        song_id=song_id,
        defaults={'play_count': 1}
    )

    if not created:
        res.play_count = F('play_count') + 1
        res.save()
    context = {
        'success': True,
        'file_path': song[0].file_path.url,
    }

    return JsonResponse(context)


@csrf_protect
@login_required(login_url='/')
def get_song_by_id(request, song_id):
    song = Song.objects.get(id=song_id)
    file_path = song.file_path.path
    _64_KB = 64 * 1024

    def file_iterator(file_path_mp3, chunk_size=_64_KB):
        with open(file_path_mp3, "rb") as f:
            while chunk := f.read(chunk_size):
                yield chunk

    response = StreamingHttpResponse(file_iterator(file_path), content_type="audio/mpeg")
    response["Content-Disposition"] = f'inline; filename="{song.file_path.path}"'
    return response

    # @csrf_protect
    # @login_required(login_url='/')
    # def get_song_by_id(request, song_id):
    #     song = Song.objects.get(id=song_id)
    #     return FileResponse(open(song.file_path.path, 'rb'), content_type='audio/mpeg')


@csrf_protect
@login_required(login_url='/')
def play_history(request):
    tag = request.GET.get('tag')

    user = request.user
    collected_songs = (UserCollectionSong.objects.filter(user=request.user, song=OuterRef('pk'))
                       .values('song_id'))
    play_count_subquery = PlayHistory.objects.filter(
        user=user,
        song=OuterRef('pk')
    ).values('play_count')[:1]
    songs = (
        Song.objects
        .annotate(
            play_count=Coalesce(
                Subquery(play_count_subquery, output_field=dm.IntegerField()),
                Value(0),
                output_field=dm.IntegerField()
            ),
            is_collected=Case(
                When(Exists(collected_songs), then=Value(True)),
                default=Value(False),
                output_field=BooleanField()
            )
        )
    ).order_by('-play_count', 'id')
    if tag:
        songs = songs.filter(Q(list_labels__icontains=tag))
    paginator = Paginator(songs, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'songs': page_obj,
        'pos': 'history'
    }
    return render(request, 'users/history.html', context)


# 打分
@csrf_protect
@login_required(login_url='/')
def score(request, song_id):
    if request.method == 'POST':
        score_ = json.loads(request.body)['score']
        obj, created = UserScoreOnSong.objects.get_or_create(user=request.user, song_id=song_id)
        obj.score = score_
        obj.save()
    return JsonResponse({'success': True})


def user_some_count(df: pd.DataFrame, user_id: int) -> Tuple[dict, dict]:
    user_df = df[df['user_id'] == user_id]
    dic_labels = ctl.defaultdict(int)
    dic_artist = ctl.defaultdict(int)

    for _, row in user_df.iterrows():
        labels = row['list_labels'].split()
        for label in labels:
            dic_labels[label] += row['user_play_count']
        dic_artist[row['artist']] += row['user_play_count']
    return dic_labels, dic_artist


def get_all_user_song() -> QuerySet:
    users = User.objects.all()
    qs = set()
    for user in users:
        qs.add(get_song(user))
    qs = ftl.reduce(lambda x, y: x.union(y), qs)
    return qs


import math


def ln_1(x):
    return math.log(1 + x)


def get_user_song_score_df1(df: pd.DataFrame, user_id: int) -> pd.DataFrame:
    user_df = df[df['user_id'] == user_id]
    label_c, artist_c = user_some_count(user_df, user_id)

    max_freq_label = max(max(label_c.values(), default=1), 1)
    max_freq_artist = max(max(artist_c.values(), default=1), 1)
    dic_res = ctl.defaultdict(list)
    for idx, song in user_df.iterrows():
        data = song.list_labels.split()
        x = max(label_c.get(d, 0) for d in data)
        dic_res['user_id'].append(user_id)
        dic_res['item_id'].append(song['id'])
        label_score = x / max_freq_label * 100
        collect_score = song['is_collected'] * 100
        artist_score = artist_c.get(song['artist'], 0) / max_freq_artist * 100
        score_ = song['score'] * 10
        dic_res['rating'].append(score_ * 0.4 + collect_score * 0.4 + label_score * 0.2)
    return pd.DataFrame(dic_res)


def get_user_song_score_df(df: pd.DataFrame, user_id: int) -> pd.DataFrame:
    user_df = df[df['user_id'] == user_id]
    label_c, artist_c = user_some_count(user_df, user_id)

    max_freq_label = max(max(label_c.values(), default=1), 1)
    max_freq_artist = max(max(artist_c.values(), default=1), 1)
    max_play_count = user_df['user_play_count'].max() or 1

    dic_res = ctl.defaultdict(list)

    for _, song in user_df.iterrows():
        labels = song.list_labels.split()
        top_label_freq = max((label_c.get(label, 0) for label in labels), default=0)
        label_score = (top_label_freq / max_freq_label) * 100
        artist_score = (artist_c.get(song['artist'], 0) / max_freq_artist) * 100

        raw_score = song['score'] * 10
        collect_score = 50 if song['is_collected'] else 0

        play_score = (np.log1p(song['user_play_count']) / np.log1p(max_play_count)) * 100

        final_score = (

                0.30 * raw_score +
                0.25 * collect_score +
                0.15 * label_score +
                0.15 * artist_score +
                0.15 * play_score
        )

        dic_res['user_id'].append(user_id)
        dic_res['item_id'].append(song['id'])
        dic_res['rating'].append(final_score)

    return pd.DataFrame(dic_res)


def get_all_user_item_score(df: pd.DataFrame) -> pd.DataFrame:
    ds = []
    for user in User.objects.all():
        ds.append(get_user_song_score_df(df, user.id))
    return pd.concat(ds, axis=0)


def get_top_n(predictions, n=10):
    """从预测结果中提取每个用户的Top-N推荐"""
    top_n = ctl.defaultdict(list)
    for uid, iid, true_r, est, _ in predictions:
        top_n[uid].append((iid, est))

    for uid, user_ratings in top_n.items():
        user_ratings.sort(key=lambda x: x[1], reverse=True)
        top_n[uid] = user_ratings[:n]
    return top_n


from surprise import Dataset, Reader, accuracy, KNNBasic
from surprise import model_selection
import pandas as pd


def tmp_recommendations(df: pd.DataFrame, n=10) -> tuple[defaultdict[Any, list], dict[str, Any]]:
    reader = Reader(rating_scale=(1, 100))
    data = Dataset.load_from_df(df[['user_id', 'item_id', 'rating']], reader)

    train_set, test_set = model_selection.train_test_split(data, test_size=0.2)

    sim_options = {
        'name': 'pearson',
        'user_based': True
    }

    algo = KNNBasic(sim_options=sim_options)
    algo.fit(train_set)
    predictions = algo.test(test_set)

    ps = {
        "RMSE": round(accuracy.rmse(predictions), 2),
        "MSE": round(accuracy.mse(predictions), 2),
        "MAE": round(accuracy.mae(predictions), 2),
        "FCP": round(accuracy.fcp(predictions), 2)
    }

    return get_top_n(predictions, n=n), ps


@csrf_protect
@login_required(login_url='/')
def recommend(request):
    qs = get_all_user_song()
    song_df = pd.DataFrame(qs)
    song_df['score'].fillna(song_df['score'].mean(), inplace=True)
    tag = request.GET.get('tag')
    song_data = get_all_user_item_score(song_df)
    lst_data, ps = tmp_recommendations(song_data, 20)
    lst_data = lst_data[request.user.id]
    song_set = {x[0] for x in lst_data}
    songs: QuerySet = get_song(request.user)
    songs = songs.filter(id__in=song_set)
    if tag:
        songs = songs.filter(list_labels__icontains=tag)
    paginator = Paginator(songs, 20)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
        'page_obj': page_obj,
        'pos': 'recommend',
        'ps': ps
    }

    return render(request, 'index/recommend.html', context)
