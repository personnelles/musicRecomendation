from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.models import User
from django.contrib.sessions.models import Session
from django.db.models import OuterRef, Subquery, IntegerField, Max
from django.db.models.functions import Coalesce
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_protect, csrf_exempt

from index.models import Song
from .forms import RegistrationForm, CustomUserChangeForm
from .models import PlayHistory

from index.views import user_some_count, get_all_user_song





# 注册用户
@csrf_protect
def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)

        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()

            login(request, user)
            return redirect('my_users:login')
    else:
        form = RegistrationForm()
    return render(request, 'users/register.html', {'form': form})


# 用户登录


@csrf_exempt
def user_login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        try:

            user = User.objects.get(username=username)
        except User.DoesNotExist:

            return render(request, 'users/login.html', {
                'error': '用户名或密码错误'
            })

        # 检查用户是否被禁用
        if not user.is_active:
            return render(request, 'users/login.html', {
                'error': '您的账户已被禁用，请联系管理员'
            })

        # 进行密码验证
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, f"welcome, {user.username}！")
            return redirect('index:home')
        else:
            return render(request, 'users/login.html', {
                'error': '用户名或密码错误'
            })

    return render(request, 'users/login.html')


# 用户修改
@login_required(login_url='/')
def user_edit(request):
    if request.method == 'POST':
        form = CustomUserChangeForm(request.POST, instance=request.user)

        if form.is_valid():
            form.save()
            return redirect('my_users:profile')  # 改完跳回个人主页
    else:
        form = CustomUserChangeForm(instance=request.user)

    return render(request, 'users/user_edit.html', {'form': form})


# 用户登出
@csrf_protect
@login_required
def user_logout(request):
    logout(request)
    return redirect('my_users:logout')


# 修改密码
@csrf_protect
@login_required(login_url='/')
def change_password(request):
    user = request.user
    if request.method == 'POST':
        form = PasswordChangeForm(data=request.POST, user=user)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            messages.success(request, '密码修改成功！')
            return redirect('index:home')

    else:
        PasswordChangeForm(user=user)
    return render(request, 'users/change_password.html')


# 修改密码
@login_required
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            form.save()
            return redirect('index:home')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'users/password_reset.html', {'form': form})


import pandas as pd
import collections as ctl


@csrf_protect
@login_required(login_url='/')
def get_profile(request):

    user = request.user

    qs = get_all_user_song()
    song_df = pd.DataFrame(qs)
    u, v = user_some_count(song_df, user.id)
    u = ctl.Counter(u).most_common(1)
    v = ctl.Counter(v).most_common(1)
    play_count_subquery = PlayHistory.objects.filter(
        user=user,
        song=OuterRef('pk')
    ).values('play_count')[:1]
    songs = (
        Song.objects
        .annotate(
            play_count=Coalesce(
                Subquery(play_count_subquery, output_field=IntegerField()),
                0
            )
        )
    ).order_by('-play_count', 'id')

    max_play_count = songs.aggregate(max_count=Max('play_count'))['max_count'] or 0
    if max_play_count and max_play_count > 0:
        top_songs = songs.filter(play_count=max_play_count)
    else:
        top_songs = Song.objects.none()

    messages.info(request, '这是您的主页')

    context = {
        'labels': u,
        'artist': v,
        'user': user,
        'songs': songs,
        'top_songs': top_songs,
        'pos': 'profile'
    }

    return render(request, 'users/profile.html', context)
