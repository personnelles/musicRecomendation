from django.core.validators import MinValueValidator, MaxValueValidator, FileExtensionValidator

from django.db import models


# Create your models here.


# 歌曲orm模型，
class Song(models.Model):
    id = models.AutoField(unique=True,
                          primary_key=True,
                          verbose_name='歌曲ID')
    name = models.CharField(max_length=255,
                            verbose_name='歌曲')

    artist = models.CharField(max_length=255, null=True,
                              verbose_name='创作者')
    pop = models.IntegerField(default=50,
                              validators=[MinValueValidator(0), MaxValueValidator(100)],
                              verbose_name='流行度'
                              )  # 流行度0-100之间的数字
    list_labels = models.CharField(max_length=1023,
                                   verbose_name='流派')
    file_path = models.FileField(upload_to='songs/', null=True,
                                 verbose_name='文件路径',

                                 validators=[FileExtensionValidator(allowed_extensions=['mp3'])]

                                 )  # 文件路径
    create_at = models.DateTimeField(auto_now_add=True,
                                     verbose_name='添加时间')

    def __str__(self):
        return f'{self.name}'

    class Meta:
        verbose_name = "歌曲"
        verbose_name_plural = "歌曲"
        ordering = ['-pop', 'name']
        indexes = [
            models.Index(fields=['name'], name='idx_song_name'),
            models.Index(fields=['artist'], name='idx_song_artist'),
            models.Index(fields=['pop'], name='idx_song_pop')
        ]


class Dynamic(models.Model):
    song = models.OneToOneField(Song, on_delete=models.CASCADE)
    total_play_count = models.IntegerField(default=0, verbose_name="播放总次数")
    collect_count = models.IntegerField(default=0, verbose_name="收藏总次数")

    class Meta:
        verbose_name = '歌曲信息'
        verbose_name_plural = '歌曲信息'


# select * from User u left join