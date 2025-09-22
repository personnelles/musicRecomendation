from urllib.parse import parse_qsl, urlencode

from django import template

register = template.Library()


@register.filter(name='split_by_space')
def split_by_space(value):
    return value.split() if value else []


@register.filter(name='update_query')
def update_query(get_params, new_query):
    query_dict = dict(parse_qsl(get_params))
    try:
        key, value = new_query.split("=", 1)
    except ValueError:
        return get_params
    query_dict[key] = value
    return urlencode(query_dict)


@register.filter(name='my_add')
def my_add(a, b):
    return str(a) + str(b)


@register.filter(name='my_dict_get')
def my_dict_get(d, key):
    return d.get(key, None)
