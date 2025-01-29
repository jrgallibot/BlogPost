from django.db import models

class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    middle_name = models.CharField(max_length=150, blank=True, null=True)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    @property
    def get_fullname_formatted(self):
        return "{}, {} {}".format(self.last_name.title(), self.first_name.title(),
                                  self.middle_name[:1] + "." if self.middle_name else '')

    class Meta:
        managed = False
        db_table = 'auth_user'

        
class BlogPost(models.Model):
    title = models.CharField(max_length=255)
    content = models.TextField()
    author = models.ForeignKey(AuthUser, on_delete=models.CASCADE)
    published_date = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(default=True) # 1 = draft, 0 = not draft

    def __str__(self):
        return self.title

class CommentPost(models.Model):
    post = models.ForeignKey(BlogPost, on_delete=models.CASCADE, related_name="comments")
    content = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    commentby = models.ForeignKey(AuthUser, on_delete=models.CASCADE)

    def __str__(self):
        return self.content