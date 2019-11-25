from django.urls import path
from . import views

urlpatterns = [

    path('<int:stu_no>/', views.stu_info, name="stu_info"),
    path('login.html/', views.login, name="login")
    # path("", views.index, name='index')
]