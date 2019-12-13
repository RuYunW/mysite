from django.urls import path
from . import views
from account.views import register, student_download

urlpatterns = [
    path('Adm_manage_courses.html/', views.Adm_mng_cou, name='Adm_mng_cou'),
    path('Adm_manage_students.html/', register, name='Adm_mng_stu'),
    path('Adm_manage_teachers.html/', views.Adm_mng_tea, name='Adm_mng_tea'),
    path('index.html/', views.index, name='index'),
    path('Stu_elective_selected.html/', views.stu_ele_select, name='stu_ele_select'),
    path('Stu_modify_information.html/', views.stu_mod_info, name='stu_mod_info'),
    path('Stu_my_grade.html/', views.stu_my_grade, name='stu_my_grade'),
    path('Stu_my_schedule.html/', views.stu_my_sch, name='stu_my_sch'),
    path('Stu_required_selected.html/', views.stu_req_selected, name='stu_req_select'),
    path('Stu_select_sourses.html/', views.stu_select_src, name='stu_select_src'),
    path('Stu_select_sourses.html/<int:course_id>/', views.stu_course_detailed),
    path('welcome_Adm.html/', views.wel_adm, name='wel_adm'),
    path('welcome_Stu.html/', views.wel_stu, name='wel_stu'),
    path(r'down_load/student_import/', student_download, name='student_import'),
    path(r'down_load/course_import/', views.course_download, name='course_import'),
    path(r'down_load/teacher_import/', views.teacher_download, name='teacher_import'),

    path('Tea_my_schedule.html/', views.tea_my_sch, name="Tea_my_sch"),
    path('Tea_student.html/', views.tea_student, name="Tea_student"),
    path('Tea_student_grade.html/', views.tea_student_grade, name="Tea_student_grade"),
    path('welcome_Tea.html/', views.welcome_tea, name="Welcome_tea"),
    path("Adm_input_time.html/", views.Adm_inp_time, name="Adm_inp_time"),
    path("Adm_select_tine.html/", views.Adm_sel_time, name="Adm_sel_time"),
    path("Adm_student_alter.html/", views.Adm_sdu_alt, name="Adm_sdu_alt"),
    path("Adm_teacher_alter.html/", views.Adm_tea_alt, name="Adm_tea_alt"),
    path("Adm_course_alter.html/", views.Adm_cou_alt, name="Adm_cou_alt"),
    path("Adm_backup_restore.html/", views.Adm_ba_re, name="Adm_ba_re"),
    path("Adm_manage_students.html/<int:student_id>/", views.Adm_sdu_alt),
    path("Adm_manage_teachers.html/<int:teacher_id>/", views.Adm_tea_alt),
    path("Adm_manage_courses.html/<str:course_select_id>/", views.Adm_cou_alt),

]