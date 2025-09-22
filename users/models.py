from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
# myapp/models.py
from django.db import models

from index.models import Song


# Create your models here.


# 用户播放记录

class PlayHistory(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户')
    song = models.ForeignKey(Song, on_delete=models.CASCADE, verbose_name='歌曲')
    play_count = models.IntegerField(default=0, verbose_name='播放次数')

    def __str__(self):
        return f'PlayHistory({self.user_id} played {self.song_id} {self.play_count} times)'

    class Meta:
        verbose_name = "播放记录"
        verbose_name_plural = "播放记录"

        indexes = [
            models.Index(fields=['user'], name='idx_play_history_user'),
        ]

        unique_together = ('user', 'song')

        app_label = 'users'


class UserCollectionSong(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户')
    song = models.ForeignKey(Song, on_delete=models.CASCADE, verbose_name='歌曲')
    collect_at = models.DateTimeField(auto_now_add=True, verbose_name='收藏时间')

    def __str__(self):
        return f"UserCollectionSong({self.user} collects {self.song} at {self.collect_at})"

    class Meta:
        verbose_name = "用户收藏歌曲"
        verbose_name_plural = "用户收藏歌曲"
        indexes = [
            models.Index(fields=['user'], name='idx_user_collection_song_user'),
        ]
        constraints = [
            models.UniqueConstraint(fields=['user', 'song'], name='unique_user_song_collection')
        ]


class UserScoreOnSong(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户')
    song = models.ForeignKey(Song, on_delete=models.CASCADE, verbose_name='歌曲')
    score = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(10)],
                                verbose_name='分数')

    score_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user} || {self.song} || {self.score}"

    class Meta:
        verbose_name = "用户打分"
        verbose_name_plural = "用户打分"
        constraints = [
            models.UniqueConstraint(fields=['user', 'song'], name='unique_user_song_score')
        ]
