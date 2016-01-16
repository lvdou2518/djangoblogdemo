#coding:utf-8

from django.conf.urls import include, url
from django.conf import settings
from django.conf.urls import patterns
import common,views

urlpatterns = [
    url(r'^ueditor/',include('DjangoUeditor.urls' )),
    url(r'^$',common.method_splitter,{'GET':views.get_index}),
    url(r'^index/$',common.method_splitter,{'GET':views.get_index}),
    url(r'^article/(\d+)/$',common.method_splitter,{'GET':views.get_view,'POST':views.post_view}),
    url(r'^category/(\d+)/$',common.method_splitter,{'GET':views.get_category_articles}),
    url(r'^tag/(\d+)/$',common.method_splitter,{'GET':views.get_tag_articles}),
    url(r'^archive/([0-9]{4})/([1-9]|1[1-2])/$',common.method_splitter,{'GET':views.get_archive_articles}),
    url(r'^search/$',common.method_splitter,{'GET':views.search_article_by_keyword,'POST':views.search_article_by_keyword}),
    url(r'^about/$',common.method_splitter,{'GET':views.get_about}),
    url(r'^feed/$',views.LatestArticlesFeed())
    ]
if settings.DEBUG:
    urlpatterns += patterns('',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root':settings.MEDIA_ROOT}),
    )