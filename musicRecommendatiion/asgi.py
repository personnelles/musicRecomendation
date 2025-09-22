"""
ASGI config for musicRecommendatiion project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.2/howto/deployment/asgi/
"""

import os

from django.core.asgi import get_asgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'musicRecommendatiion.settings')

application = get_asgi_application()
# uvicorn --host=localhost --port=8001 musicRecommendatiion.asgi:application