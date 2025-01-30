import pytest
import django
import os
import logging

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "myblog.settings")
django.setup()

from django.contrib.auth import get_user_model
from django.contrib.auth.models import Permission
from django.urls import reverse
from rest_framework.test import APIClient
from blog.models import BlogPost, CommentPost

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
logger = logging.getLogger(__name__)

User = get_user_model()

@pytest.fixture
def api_client():
    return APIClient()

@pytest.fixture
def admin_user(db):
    user = User.objects.create_user(
        username='admin', 
        password='12345678',
        email='admin@example.com'
    )
    add_perm = Permission.objects.get(codename='add_blogpost')
    change_perm = Permission.objects.get(codename='change_blogpost')
    user.user_permissions.add(add_perm, change_perm)

    logger.info(f"Created admin user: {user.username}")
    return user

@pytest.fixture
def regular_user(db):
    user = User.objects.create_user(
        username='sample_user', 
        password='sample_password',
        email='regular@example.com'
    )
    logger.info(f"Created regular user: {user.username}")
    return user

@pytest.fixture
def test_post(db, admin_user):
    post = BlogPost.objects.create(
        title='Test Post',
        content='Test Content',
        author=admin_user
    )
    logger.info(f"Created test blog post: {post.title} (ID: {post.id})")
    return post

@pytest.mark.django_db
class TestBlogPostListing:
    endpoint = reverse('api_blog_posts')

    def test_list_posts_unauthenticated(self, api_client):
        endpoint = reverse('api_blog_posts')
        response = api_client.get(endpoint)
        logger.info(f"Unauthenticated request to {endpoint}: Status {response.status_code}")
        assert response.status_code == 403

    def test_list_posts_authenticated(self, api_client, admin_user, test_post):
        api_client.force_authenticate(user=admin_user)
        
        # Log the number of blog posts before API call
        post_count_before = BlogPost.objects.count()
        logger.info(f"Blog posts in DB before request: {post_count_before}")

        response = api_client.get(self.endpoint)

        # Log response and number of posts returned
        logger.info(f"Authenticated GET {self.endpoint}: Status {response.status_code}, Response data: {response.data}")

        post_count_after = BlogPost.objects.count()
        logger.info(f"Blog posts in DB after request: {post_count_after}")

        assert response.status_code == 200
        assert len(response.data["results"]) == 1

    def test_filter_by_title(self, api_client, admin_user):
        api_client.force_authenticate(user=admin_user)
        BlogPost.objects.create(title='Python Tutorial', author=admin_user)
        BlogPost.objects.create(title='Django Guide', author=admin_user)

        response = api_client.get(self.endpoint, {'title': 'python'})
        logger.info(f"Filtering posts by title 'python': Status {response.status_code}, Response: {response.data}")

        assert response.status_code == 200
        assert len(response.data["results"]) == 1

@pytest.mark.django_db
class TestBlogPostCreation:
    endpoint = reverse('blogpost-create')

    def test_create_post_success(self, api_client, admin_user):
        api_client.force_authenticate(user=admin_user)

        data = {'title': 'New Post', 'content': 'Content'}
        logger.info(f"Attempting to create blog post with data: {data}")

        response = api_client.post(self.endpoint, data)
        logger.info(f"Create post response: Status {response.status_code}, Data: {response.data}")

        assert response.status_code == 201

@pytest.mark.django_db
class TestCommentCreation:
    def test_create_comment(self, api_client, admin_user, test_post):
        api_client.force_authenticate(user=admin_user)
        
        comment_data = {'content': 'Test comment'}
        logger.info(f"Attempting to add comment: {comment_data} on post ID: {test_post.id}")

        response = api_client.post(
            reverse('comment-create', kwargs={'post_id': test_post.id}),
            comment_data
        )

        logger.info(f"Create comment response: Status {response.status_code}, Data: {response.data}")

        assert response.status_code == 201
