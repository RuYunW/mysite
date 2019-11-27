from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login
from .forms import LoginForm, RegistrationForm


def index(request):
    return render(request, "edu_admin/index.html")


def user_login(request):
    if request.method == "POST":
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            cd = login_form.cleaned_data
            user = authenticate(username=cd['username'], password=cd['password'])
            if user:
                login(request, user)
                if user.is_superuser:
                    return render(request, "edu_admin/welcome_Adm.html", {"form": login_form})  # 管理员
                else:
                    return render(request, "edu_admin/welcome_Stu.html", {"form": login_form})  # 普通用户
            else:
                return render(request, "account/login.html", {"form": login_form, 'script': "alert", 'wrong': '用户名或密码错误'})
        else:
            return HttpResponse("Invalid Login")

    if request.method == "GET":
        login_form = LoginForm()
        return render(request, "account/login.html", {"form": login_form})

def register(request):
    if request.method=="POST":
        user_form = RegistrationForm(request.POST)
        if user_form.is_valid():
            new_user = user_form.save(commit=False)
            new_user.set_password(user_form.cleaned_data['password'])
            new_user.save()
            return HttpResponse("successfully")
        else:
            return HttpResponse("sorry.")
    else:
        user_form = RegistrationForm()
        return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form})