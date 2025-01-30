from django.db import models
from django.contrib.auth.models import AbstractUser

class AuthUser(AbstractUser):
    middle_name = models.CharField(max_length=150, blank=True, null=True)

    class Meta:
        db_table = "custom_auth_user"

        
class BlogPost(models.Model):
    title = models.CharField(max_length=255)
    content = models.TextField()
    author = models.ForeignKey(AuthUser, on_delete=models.CASCADE)
    published_date = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(default=True) # 1 = draft, 0 = not draft

    class Meta:
        pass
        
    def __str__(self):
        return self.title


class CommentPost(models.Model):
    post = models.ForeignKey(BlogPost, on_delete=models.CASCADE, related_name="comments")
    content = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    commentby = models.ForeignKey(AuthUser, on_delete=models.CASCADE)

    def __str__(self):
        return self.content