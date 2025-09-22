import os
import django
from django.db.models import Count, Case, When, F, Value, CharField
from django.db.models.functions import Now
from django.db.models.functions.math import Cos

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'musicRecommendatiion.settings')

django.setup()

from mutagen.id3 import ID3


