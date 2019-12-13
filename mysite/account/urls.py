from django.urls import path
from . import views
from django.contrib.auth import views as auth_views


app_name = "account"
urlpatterns = [
    path('', views.index, name='index'),
    #path('login.html/', views.user_login, name='user_login'),
    # path('login.html/', auth_views.LoginView.as_view(template_name='account/login.html'), name='user_login'),
    path('login.html/', views.user_login, name='user_login'),

    path('index.html/', auth_views.LogoutView.as_view(template_name='edu_admin/index.html'), name='user_logout'),

]
