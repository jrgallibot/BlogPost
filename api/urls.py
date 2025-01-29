from django.urls import path

from .views import BlogPostView, BlogPostCreateView, BlogPostUpdateView, CommentListView, CommentCreateView, \
    BlogPostDetailView

urlpatterns = [
    path('blog-posts/', BlogPostView.as_view(), name='api_blog_posts'),
    path('blogpost-detail-view/<int:pk>/', BlogPostDetailView.as_view(), name='blogpost-detail'),
    path('blogposts/create/', BlogPostCreateView.as_view(), name='blogpost-create'),
    path('blogpost/<int:pk>/edit/', BlogPostUpdateView.as_view(), name='blogpost-edit'),
    path('posts/<int:post_id>/comments/', CommentListView.as_view(), name='comment-list'),
    path('posts/<int:post_id>/comments/add/', CommentCreateView.as_view(), name='comment-create'),
]
