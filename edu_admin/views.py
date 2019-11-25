from django.shortcuts import render, get_object_or_404
from .models import Student


def stu_name(request):
    stus = Student.objects.all()
    return render(request, "edu_admin/names.html", {"stus": stus})


def stu_info(request, stu_no):
    # stu = Student.objects.get(stu_no=stu_no)
    stu = get_object_or_404(Student, stu_no=stu_no)
    school = stu.stu_school
    major = stu.stu_major
    sclass = stu.stu_class
    return render(request, "edu_admin/info.html", {"stu": stu, "school": school, "major": major, "sclass": sclass})


def wel_stu(request):
    # stu = get_object_or_404(Student, stu_no=stu_no)
    # name = stu.stu_name
    return render(request, "edu_admin/welcome_Stu.html", )


def stu_my_sch(request):
    return render(request, "edu_admin/Stu_my_schedule.html", )


def stu_select_src(request):
    return render(request, "edu_admin/Stu_select_sourses.html", )


def stu_my_grade(request):
    return render(request, "edu_admin/Stu_my_grade.html", )


def stu_req_selected(request):
    return render(request, "edu_admin/Stu_required_selected.html", )


def stu_ele_select(request):
    return render(request, "edu_admin/Stu_elective_selected.html", )


