import os
import django
from django.conf import settings
from django.contrib.sessions.backends.cache import SessionStore

# 指定 Django 设置模块
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'musicRecommendatiion.settings')  # 替换为你的项目设置

django.setup()
# 手动配置 Django
if not settings.configured:
    settings.configure()

print(settings.DATABASES)
