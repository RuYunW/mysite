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