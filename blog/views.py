from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from .models import BlogPost


# Create your views here.
def login_user(request):
    if request.user.is_authenticated:
        return redirect('landing')
    if request.method == "POST":
        user = authenticate(username=request.POST.get('username'), password=request.POST.get('password'))
        if user is not None and user.is_active:
            login(request, user)
            request.session['uid'] = user.id
            request.session['username'] = user.username
            request.session['first_name'] = user.first_name
            messages.success(request, "Welcome", extra_tags="welcome")
            return JsonResponse({'data': 'success'})
        else:
            return JsonResponse({'error': True, 'msg': 'Invalid username and password.'})
    return render(request, 'login.html')


@login_required
def logout_user(request):
    if request.user.is_authenticated:
        logout(request)
        return redirect('login_user')
    

@login_required
def dashboard(request):
    blog_posts = BlogPost.objects.all().order_by('-published_date')
    context = {
        'title': 'Dashboard',
        'li': 'dashboard',
        'blog_posts': blog_posts
    }
    return render(request, 'dashboard.html', context)

@login_required
def blogs(request):
    context = { 
        'title': 'Blog Posts',
        'li': 'blogs'
    }
    return render(request, 'blogs.html', context)
