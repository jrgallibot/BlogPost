import logging

logger = logging.getLogger('blog.tests')

def test_create_post_success(self, api_client, admin_user):
    logger.info("Starting test: test_create_post_success")
    api_client.force_authenticate(user=admin_user)
    data = {'title': 'New Post', 'content': 'Content'}
    response = api_client.post(self.endpoint, data)
    logger.debug(f"Response status: {response.status_code}, Response data: {response.data}")
    assert response.status_code == 201
    logger.info("Test passed: test_create_post_success")
