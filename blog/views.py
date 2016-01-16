#coding:utf-8
from django.shortcuts import render,redirect,get_object_or_404
from models import Article,Category,Tag,Reply
from django.http import Http404
from forms.articleForm import ReplyForm
from django.utils import timezone
from django.contrib.syndication.views import Feed
def get_index(req):
    try:
        current_page = int(req.GET.get('p',1))
    except ValueError:
        current_page = 1

    articles,article_page = Article.objects.get_all_articles(current_page=current_page)
    categories = Category.objects.get_all_categories()
    tags = Tag.objects.get_all_tags()
    recent_articles = Article.objects.get_recent_articles()
    archives_date = Article.objects.get_archives_date()
    title = "首页"
    return render(req,'index.html',locals())


def get_view(request,article_id,errors=None):
    try:
        article = Article.objects.get_article_by_article_id(article_id)
    except Article.DoesNotExist:
        raise Http404

    reply_num = 120

    try:
        current_page = int(request.GET.get('p',1))
    except ValueError:
        current_page = 1

    floor = reply_num * (current_page-1)
    replies,reply_page = Reply.objects.get_all_replies_by_article_id(article_id,current_page=current_page,num=reply_num)
    # print(reply_page.pages)
    article.reply_count = reply_page.total
    article.hits = (article.hits or 0) + 1
    article.save()

    categories = Category.objects.get_all_categories()
    tags = Tag.objects.get_all_tags()
    recent_articles = Article.objects.get_recent_articles()
    archives_date = Article.objects.get_archives_date()
    title = article.title

    return render(request,'article.html',locals())


def post_view(request,article_id):
    try:
        article = Article.objects.get_article_by_article_id(article_id)
    except Article.DoesNotExist:
        raise Http404

    form = ReplyForm(request.POST)
    if not form.is_valid():
        return get_view(request,article_id,errors=form.errors)

    now = timezone.now()

    reply = Reply(
        article = article,
        nickname = form.cleaned_data.get('nickname'),
        content = form.cleaned_data.get('content'),
        created = now,
    )

    reply.save()

    return redirect('/article/%s/#reply' %article.id )


def get_category_articles(request,category_id):
    category = get_object_or_404(Category,id=int(category_id))
    try:
        current_page = int(request.GET.get('p',1))
    except ValueError:
        current_page = 1

    articles,article_page = Article.objects.get_articles_by_category(category_id=category_id,current_page=current_page)

    categories = Category.objects.get_all_categories()
    tags = Tag.objects.get_all_tags()
    recent_articles = Article.objects.get_recent_articles()
    archives_date = Article.objects.get_archives_date()

    title = "分类：%s" % category

    return render(request,'index.html',locals())


def get_tag_articles(request,tag_id):
    tag = get_object_or_404(Tag,id=int(tag_id))
    try:
        current_page = int(request.GET.get('p',1))
    except ValueError:
        current_page = 1

    articles,article_page = Tag.objects.get_articles_by_tag(tag_id=tag_id,current_page=current_page)

    categories = Category.objects.get_all_categories()
    tags = Tag.objects.get_all_tags()
    recent_articles = Article.objects.get_recent_articles()
    archives_date = Article.objects.get_archives_date()

    title = "标签：%s" % tag

    return render(request,'index.html',locals())


def get_archive_articles(request,year,month):
    try:
        current_page = int(request.GET.get('p',1))
    except ValueError:
        current_page = 1

    articles,article_page = Article.objects.get_articles_by_date(year=year,month=month,current_page=current_page)

    categories = Category.objects.get_all_categories()
    tags = Tag.objects.get_all_tags()
    recent_articles = Article.objects.get_recent_articles()
    archives_date = Article.objects.get_archives_date()

    title = "（%s年%s月）归档" % (str(year),str(month))

    return render(request,'index.html',locals())


def search_article_by_keyword(request,keyword=None):
    if request.method=='POST':
        keyword = request.POST.get('keyword',None)
    elif request.method == 'GET':
        keyword = request.GET.get('keyword',None)

    if (keyword == None) or (keyword == ""):
        return redirect('/index/')


    try:
        current_page = int(request.GET.get('p',1))
    except ValueError:
        current_page = 1

    articles,article_page = Article.objects.get_articles_by_keyword(keyword=keyword,current_page=current_page)

    categories = Category.objects.get_all_categories()
    tags = Tag.objects.get_all_tags()
    recent_articles = Article.objects.get_recent_articles()
    archives_date = Article.objects.get_archives_date()

    title = "searching:%s" % keyword

    return render(request,'index.html',locals())


def get_about(request):
    categories = Category.objects.get_all_categories()
    tags = Tag.objects.get_all_tags()
    recent_articles = Article.objects.get_recent_articles()
    archives_date = Article.objects.get_archives_date()

    return render(request,'about.html',locals())

class LatestArticlesFeed(Feed):
    #订阅标题
    title = u"傅sir的博客的更新"
    link = "/feed/"
    #描述
    description = "python,falsk,Django,Tornado,android,程序设计,分享,网络安全,黑客攻防,自动化运维,大数据分析,前端设计,动画"
    #订阅的数据
    def items(self):
        return Article.objects.order_by('-created')[:50]
    #订阅的标题
    def item_title(self, item):
        return item.title
    #订阅的表示
    def item_description(self, item):
        return item.created
    #每条订阅的链接
    def item_link(self,item):
        return "/article/"+str(item.id)+"/"