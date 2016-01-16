#coding:utf-8
from django.db import models
from django.utils import timezone
from DjangoUeditor.models import UEditorField
from django.db import connection
from django.db.models import Q,Count


class Pages(object):
    def __init__(self,count,current_page=1,list_rows=40):
        self.total = count
        self._current = current_page
        self.size = list_rows
        self.pages = self.total // self.size + (1 if self.total%self.size else 0)

        if (self.pages==0) or (self._current<1) or (self._current>self.pages):
            self.start = 0
            self.end = 0
            self.index = 1
        else:
            self.start = (self._current-1) * self.size
            self.end = self.size + self.start
            self.index = self._current
        self.prev = self.index-1 if self.index>1 else self.index
        self.next = self.index+1 if self.index<self.pages else self.index

class ArticleManager(models.Manager):
    def get_all_articles(self,num=10,current_page=1):
        count = self.get_queryset().count()
        page = Pages(count,current_page,num)
        query = self.get_queryset().prefetch_related('category','tags').all().order_by('-created','-id')[page.start:page.end]
        return query,page


    def get_recent_articles(self):
        return self.all().order_by('-created')[:5]

    def get_article_by_article_id(self,article_id):
        return self.select_related('category').get(pk=article_id)

    def get_archives_date(self):
        t_date = connection.ops.date_trunc_sql('month', 'created')
        qs = self.extra({'date':t_date})
        archives_date = qs.values('date').annotate(Count('pk')).order_by('date')
        return archives_date

    def get_articles_by_category(self,num=10,current_page=1,category_id=None):
        count = self.filter(category__id=category_id).count()
        page = Pages(count,current_page,num)
        query = self.select_related('category').filter(category__id=category_id).order_by('-created')[page.start:page.end]
        return  query,page

    def get_articles_by_date(self,num=30,current_page=1,year=None,month=None):
        count = self.filter(created__year=year,created__month=month).count()
        page = Pages(count,current_page,num)
        query  = self.filter(created__year=year,created__month=month).order_by('-created')[page.start:page.end]
        return query,page

    def get_articles_by_keyword(self,num=10,current_page=1,keyword=None):
        count = self.all().filter(Q(title__contains=keyword)).count()
        page = Pages(count,current_page,num)
        query = self.all().filter(Q(title__contains=keyword)).order_by('-created')[page.start:page.end]
        return query,page


class CategoryManager(models.Manager):
    def get_all_categories(self):
        return self.all().order_by('-created')

class TagManager(models.Manager):
    def get_all_tags(self):
        return self.all().order_by('-created')

    def get_articles_by_tag(self,num=10,current_page=1,tag_id=None):
        count = self.get(id=tag_id).article_set.count()
        page = Pages(count,current_page,num)
        query = self.get(id=tag_id).article_set.all().order_by('-created')[page.start:page.end]
        return query,page

class ReplyManager(models.Manager):
    def get_all_replies_by_article_id(self,article_id,num=30,current_page=1):
        count = self.filter(article__id=article_id).count()
        page = Pages(count,current_page,num)
        query = self.filter(article__id=article_id).order_by('-created')[page.start:page.end]
        return query,page

class Category(models.Model):
    name = models.CharField(max_length=50)
    created = models.DateTimeField(default=timezone.now)

    def __unicode__(self):
        return self.name

    objects= CategoryManager()

class Tag(models.Model):
    name = models.CharField(max_length=50)
    created = models.DateTimeField(default=timezone.now)

    def __unicode__(self):
        return self.name

    objects = TagManager()

class Article(models.Model):
    title = models.CharField(max_length=200)
    content = UEditorField(u'内容   ',width=700, height=800, toolbars="full", imagePath="upload/images/%(basename)s_%(datetime)s.%(extname)s", filePath="upload/files/%(basename)s_%(datetime)s.%(extname)s",
                           upload_settings={"imageMaxSize":1204000,},settings={'autoHeightEnabled': 'true','autoFloatEnabled': 'true',},blank=True)
    created = models.DateTimeField(default=timezone.now)
    hits = models.IntegerField(default=0)
    reply_count = models.IntegerField(default=0)
    category = models.ForeignKey(Category)
    tags = models.ManyToManyField(Tag)

    def __unicode__(self):
        return self.title

    objects = ArticleManager()

class Reply(models.Model):
    nickname = models.CharField(max_length=200)
    article = models.ForeignKey(Article)
    created = models.DateTimeField(default=timezone.now)
    content = models.TextField()

    def __unicode__(self):
        return self.nickname

    objects = ReplyManager()