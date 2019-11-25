from django.urls import path
from . import views

urlpatterns = [

    path('welcome_Stu.html/', views.wel_stu, name='wel_stu'),
    path('Stu_my_schedule.html/', views.stu_my_sch, name='stu_my_sch'),
    path('Stu_select_sourses.html/', views.stu_select_src, name='stu_select_src'),
    path('Stu_my_grade.html/', views.stu_my_grade, name='stu_my_grade'),
    path('Stu_required_selected.html/', views.stu_req_selected, name='stu_req_select'),
    path('Stu_elective_selected.html/', views.stu_ele_select, name='stu_ele_select'),


    # path('<int:stu_no>/', views.stu_info, name="stu_info"),

    # path('login.html/', views.user_login, name="login")
    # path("", views.index, name='index')
]