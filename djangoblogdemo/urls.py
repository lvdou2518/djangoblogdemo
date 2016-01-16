from django.conf.urls import include, url
from django.contrib import admin
import blog.urls
urlpatterns = [
    # Examples:
    # url(r'^$', 'djangoblogdemo.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^',include(blog.urls)),
]
