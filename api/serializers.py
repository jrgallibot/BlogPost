from rest_framework import serializers
from blog.models import BlogPost, CommentPost


class BlogPostSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    author = serializers.CharField(source='author.get_fullname_formatted', read_only=True)
    published_date = serializers.DateTimeField(format="%b %d, %Y - %H:%M %p", read_only=True)

    class Meta:
        model = BlogPost
        fields = '__all__'
        read_only_fields = ['author', 'published_date']


class CommentPostSerializer(serializers.ModelSerializer):
    commentby_username = serializers.CharField(source='commentby.username', read_only=True)

    class Meta:
        model = CommentPost
        fields = ['id', 'content', 'created', 'commentby_username']

    def create(self, validated_data):
        return CommentPost.objects.create(**validated_data)
