from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver

from index.models import Dynamic
from .models import UserCollectionSong, PlayHistory
from django.db.models import F, Sum


@receiver(post_save, sender=UserCollectionSong)
def increase_collect_count(sender, instance, created, **kwargs):
    dyc = Dynamic.objects.filter(song_id=instance.song_id)
    if dyc.exists():
        dyc.update(collect_count=F('collect_count') + 1)
    else:
        Dynamic(song_id=instance.song_id, collect_count=1).save()


@receiver(post_delete, sender=UserCollectionSong)
def decrease_collect_count(sender, instance: UserCollectionSong, **kwargs):
    dyc = Dynamic.objects.filter(song_id=instance.song_id)
    if dyc.exists():
        dyc.update(collect_count=F('collect_count') - 1)


@receiver(post_save, sender=PlayHistory)
def increase_play_count(sender, instance, created, **kwargs):
    res = PlayHistory.objects.filter(song_id=instance.song_id).aggregate(Sum('play_count'))['play_count__sum']
    info, created = Dynamic.objects.get_or_create(song_id=instance.song_id)
    info.total_play_count = res
    info.save()


@receiver(post_delete, sender=PlayHistory)
def decrease_play_count(sender, instance: PlayHistory, **kwargs):
    res = PlayHistory.objects.filter(song_id=instance.song_id).aggregate(Sum('play_count'))['play_count__sum']
    info, created = Dynamic.objects.get_or_create(song_id=instance.song_id)
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
    if res is None:
        res = 0
    info.total_play_count = res
    info.save()

