"""
WSGI config for musicRecommendatiion project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.2/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'musicRecommendatiion.settings')

application = get_wsgi_application()

#  waitress-serve --host=localhost --port=8001 musicRecommendatiion.wsgi:application

# 柳宁媛
