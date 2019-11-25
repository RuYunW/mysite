from django.urls import path
from . import views

urlpatterns = [

    path('welcome_Stu.html/', views.wel_stu, name='wel_stu'),
    # path('<int:stu_no>/', views.stu_info, name="stu_info"),

    # path('login.html/', views.user_login, name="login")
    # path("", views.index, name='index')
]