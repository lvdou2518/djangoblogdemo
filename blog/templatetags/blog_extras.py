#coding:utf8
from django import template
import re

register = template.Library()

@register.simple_tag
def build_uri(uri, param, value): # 给uri添加参数或者修改参数的值
    regx = re.compile('[\?&](%s=[^\?&]*)' % param)
    find = regx.search(uri)
    split = '&' if re.search(r'\?', uri) else '?'
    if not find: return '%s%s%s=%s' % (uri, split, param, value)
    return re.sub(find.group(1), '%s=%s' % (param, value), uri)


@register.simple_tag
def pagination(page, uri, list_rows = 10): # 显示分页
    def gen_page_list(current_page = 1, total_page = 1, list_rows = 10):
        if total_page <= list_rows:
            return range(1, total_page + 1)
        elif current_page <= (list_rows // 2):
            return range(1, list_rows + 1)
        elif current_page >= (total_page - list_rows // 2):
            return range(total_page - list_rows + 1, total_page + 1)
        else:
            return range(current_page - list_rows // 2, current_page - list_rows // 2 + list_rows)

    t = template.Template('''
        {% load blog_extras %} {# 如果要使用自定义tag filter这里也需要加载 #}
        {% if page and page.pages > 1 %}
               <a href="{% build_uri uri 'p' page.prev %}">«</a>
                {% for p in gen_page_list %}

                        {% ifnotequal page.index p %}
                            <a href="{% build_uri uri 'p' p %}">{{ p }}</a>
                        {% else %}
                            <a href="javascript:;">{{ p }}</a>
                        {% endifnotequal %}

                {% endfor %}
                <a href="{% build_uri uri 'p' page.next %}">»</a>
        {% endif %}
        ''')
    c = template.Context(dict(page = page, uri = uri, gen_page_list = gen_page_list(page.index, page.pages, list_rows)))

    return t.render(c)

@register.filter(name='dump_errors')
def dump_errors(errors):
    t = template.Template('''
        {% if errors %}
            <ul class="errors alert alert-error">
                {% for v in errors.itervalues %}
                    <li> {{ v | join:',' }}</li>
                {% endfor%}
            </ul>
        {% endif %}
    ''')
    c = template.Context(dict(errors = errors))

    return t.render(c)