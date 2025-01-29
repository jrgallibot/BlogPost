from rest_framework import generics, permissions
from django.views.generic import DetailView, UpdateView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from blog.models import BlogPost, CommentPost
from api.serializers import BlogPostSerializer, CommentPostSerializer
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse

# View to list all blog posts
class BlogPostView(generics.ListAPIView):
    queryset = BlogPost.objects.all().order_by('-id')
    serializer_class = BlogPostSerializer
    permission_classes = [IsAuthenticated]

# View to create a new blog post
class BlogPostCreateView(generics.CreateAPIView):
    queryset = BlogPost.objects.all()
    serializer_class = BlogPostSerializer
    permission_classes = [IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(author_id=self.request.user.id)

    def create(self, request, *args, **kwargs):
        if not request.user.has_perm('blog.add_blogpost'):
            return Response({"data": "error", "msg": "You do not have permission to create a blog post."}, status=status.HTTP_403_FORBIDDEN)
        
        title = request.data.get('title')
        if BlogPost.objects.filter(title=title).exists():
            return Response({"data": "error", "msg": "A blog post with this title already exists."}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            response = super().create(request, *args, **kwargs)
            return Response({"data": "success", "msg": "Blog post created successfully."}, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({"data": "error", "msg": str(e)}, status=status.HTTP_400_BAD_REQUEST)
        
class BlogPostDetailView(DetailView):
    model = BlogPost
    template_name = 'blogs_edit.html'
    context_object_name = 'blog_post'
    pk_url_kwarg = 'pk'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Blog Post'
        return context

    def post(self, request, *args, **kwargs):
        blog_post = self.get_object()
        
        title = request.POST.get('edit_title')
        content = request.POST.get('edit_content')
        status = 'edit_status' in request.POS
        return HttpResponseRedirect(reverse('blogpost-detail', kwargs={'pk': blog_post.pk}))
    

# View to update an existing blog post
class BlogPostUpdateView(generics.UpdateAPIView):
    queryset = BlogPost.objects.all()
    serializer_class = BlogPostSerializer
    permission_classes = [IsAuthenticated]

    def update(self, request, *args, **kwargs):
        if not request.user.has_perm('blog.change_blogpost'):
            return Response({"data": "error", "msg": "You do not have permission to update this blog post."}, status=status.HTTP_403_FORBIDDEN)

        try:
            blog_post = BlogPost.objects.get(id=kwargs.get('pk'))
            blog_post.title = request.data.get('edit_title')
            blog_post.content = request.data.get('edit_content')
            
            status_value = request.data.get('edit_status')
            blog_post.status = True if status_value == 'on' else False
            
            blog_post.save()
            
            return Response({"data": "success", "msg": "Blog post updated successfully."}, status=status.HTTP_200_OK)
        except Exception as e:
            error_details = e.detail if hasattr(e, 'detail') else str(e)
            print(f"Update failed: {error_details}")
            
            return Response({"data": "error", "msg": error_details}, status=status.HTTP_400_BAD_REQUEST)


class CommentListView(generics.ListAPIView):
    serializer_class = CommentPostSerializer

    def get_queryset(self):
        post_id = self.kwargs.get("post_id")
        post = get_object_or_404(BlogPost, id=post_id)
        return post.comments.all().order_by("-created")

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
    

class CommentCreateView(generics.CreateAPIView):
    serializer_class = CommentPostSerializer
    permission_classes = [IsAuthenticated]

    def post(self, request, post_id):
        post = get_object_or_404(BlogPost, id=post_id)
        serializer = self.get_serializer(data=request.data)

        print("Received data:", request.data)
        if serializer.is_valid():
            comment = CommentPost.objects.create(
                post=post,
                content=serializer.validated_data["content"],
                commentby_id=request.user.id
            )
            return Response(CommentPostSerializer(comment).data, status=status.HTTP_201_CREATED)

        print("Serializer errors:", serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)