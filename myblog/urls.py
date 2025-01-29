"""
URL configuration for myblog project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from blog.views import login_user, blogs, logout_user, dashboard

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', login_user, name='login_user'),
    path('dashboard/', dashboard, name='dashboard'),
    path('blogs/', blogs, name='blogs'),
    path('logout/', logout_user, name='logout_user'),
    path('api/', include('api.urls')),
    path('api-auth/', include('rest_framework.urls')),
    path('api/rest-auth/', include('dj_rest_auth.urls')),
]
