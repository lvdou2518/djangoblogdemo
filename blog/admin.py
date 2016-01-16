from django.contrib import admin
from models import Article,Category,Tag,Reply



class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'created')
    search_fields = ('title', 'content')
    list_filter = ('created',)

class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'created')
    search_fields = ('name', )
    list_filter = ('created',)

class TagAdmin(admin.ModelAdmin):
    list_display = ('name', 'created')
    search_fields = ('name', )
    list_filter = ('created',)

class ReplyAdmin(admin.ModelAdmin):
    list_display = ('nickname', 'created')
    search_fields = ('nickname', 'content')
    list_filter = ('created',)

admin.site.register(Article,ArticleAdmin)
admin.site.register(Category,CategoryAdmin)
admin.site.register(Tag,TagAdmin)
admin.site.register(Reply,ReplyAdmin)
