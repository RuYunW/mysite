from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login
from .forms import LoginForm, RegistrationForm, User
from django.http import FileResponse
import xlrd
from django.db import models
from django.shortcuts import redirect
from django.contrib.auth.hashers import make_password, check_password



def index(request):
    return render(request, "edu_admin/index.html")


def user_login(request):
    # print(os.system('python manage.py dumpdata > a.json'))
    # cursor = connection.cursor()
    # cursor.execute("SELECT all_sum();")
    # print(cursor.fetchall()[0][0])

    if request.method == "POST":
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            cd = login_form.cleaned_data
            user = authenticate(username=cd['username'], password=cd['password'])
            if user:
                login(request, user)
                request.session['username'] = request.user.username
                request.session['name'] = request.user.name
                request.session['school'] = request.user.school
                request.session['major'] = request.user.major
                request.session['sclass'] = request.user.sclass
                print(request.session.get("username"))
                print(request.session.get("name"))
                if user.is_superuser:  # 如果是超级用户
                    # return render(request, "edu_admin/welcome_Adm.html", {"form": login_form, "username": request.user.username, "name": User.objects.get(username=request.user.username).name})  # 管理员
                    return render(request, "edu_admin/welcome_Adm.html", {"form": login_form})
                elif user.is_teacher:  # 如果是教师
                    return render(request, "edu_admin/welcome_Tea.html", {"form": login_form})
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
    # print(request.POST.getlist('add_button'))
    # 添加
    if request.method == "POST" and request.POST.getlist('add_button'):
        user_form = RegistrationForm(request.POST)
        # if user_form.is_valid():
        if User.objects.filter(username=request.POST.get('username')):
            error_message = "新增失败，用户已存在！"
            return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_add": True, "error_message": error_message})
        else:
            User.objects.create(
                username=request.POST.get("username"),
                name=request.POST.get('name'),
                major=request.POST.get('major'),
                sclass=request.POST.get('sclass'),
                password=make_password(request.POST.get('username')[-6:])
            )
        # new_user = user_form.save(commit=False)
        # new_user.set_password(user_form.cleaned_data['password'])
        # new_user.save()

            return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_add": True})
        # else:
        #     print(777)
        #     return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_add": False})
    # else:
    #     user_form = RegistrationForm()
    #     return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form})

    # 查询
    elif request.method == "POST" and request.POST.getlist('select_button'):
        username = request.POST.get('username')
        user_form = RegistrationForm(request.POST)
        # 查询成功
        if User.objects.filter(username=username):
            user = User.objects.get(username=username)
            print(user.name)
            return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_select": True, "user": user})
        # 查询失败
        else:
            user_form = RegistrationForm(request.POST)
            return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_select": False})
        # user = User.objects.get(username=request.username)
        # hasattr(request.user)
        # user_form = SelectForm(request.POST)
        # if user_form.is_valid():
        #     new_user = user_form.save(commit=False)
        #     new_user.set_password(user_form.cleaned_data['password'])
        #     new_user.save()
        #     return render(request, "edu_admin/Adm_manage_students.html", {"return_add": "True"})
        # else:
        #     return render(request, "edu_admin/Adm_manage_students.html", {"return_add": "False"})

    # 批量上传
    elif request.method == "POST" and request.POST.getlist('file_button'):
        user_form = RegistrationForm(request.POST)
        lines = []
        error_list = []
        myFile = request.FILES.get("myfile", None)
        error_message = ""
        if not myFile:
            error_message = "no files for upload!"
            return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_upload": False, "error_message": error_message})

        if myFile.name == 'student_import.xlsx':  # 如果是模板文件
            destination = open('media/'+myFile.name, 'wb+')
            for chunk in myFile.chunks():
                destination.write(chunk)
            destination.close()
            # 读
            x1 = xlrd.open_workbook("media/student_import.xlsx")
            table = x1.sheet_by_index(0)
            nrows = table.nrows

            if nrows <= 1:
               error_message = "文件为空，批量导入失败！"
               return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_upload": False, "error_message": error_message})

            else:  # 不为空
                for row in range(1, nrows):
                    if User.objects.filter(username=table.cell_value(row, 0)):  # 如果找到
                        # User.objects.get(username=table.cell_value(row, 0))
                        error_list.append(table.cell_value(row, 0)+":"+table.cell_value(row, 1)+",")
                    else:  # 不产生冲突，记录插入值
                        lines.append({"username": table.cell_value(row, 0), "name": table.cell_value(row, 1), "sex": table.cell_value(row, 2), "school": table.cell_value(row, 3), "major": table.cell_value(row, 4), "sclass": table.cell_value(row, 5), "admin_data": table.cell_value(row, 6)})
                # 写入数据库
                if len(lines) > 0:  # 如果工作队列lines有数据，存入数据库
                    for item in lines:
                        User.objects.create(
                            username=item["username"],
                            name=item["name"],
                            sex=item["sex"],
                            school=item["school"],
                            major=item["major"],
                            sclass=item["sclass"],
                            admin_data=item["admin_data"],
                            password=make_password(item["username"][-6:]),
                        )
                        # print(make_password('010102'))
                        # print(make_password(lines[0]["username"][-6:]))
                        # print(lines[0]["username"][-6:])
                        # print(check_password('010102', make_password(lines[0]["username"][-6:])))
                        # print(check_password('010102', make_password('010102')))

                error_message = "共上传"+str(nrows-1)+"人，成功"+str(len(lines))+"人，失败"+str(len(error_list))+"人，失败人员名单如下："

                for i in error_list:
                    error_message += i
                print(error_message)
                return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_upload": True, "error_message": error_message})
                # return render(request, "edu_admin/Adm_manage_students.html", {"status_upload": "True", "error_message": error_message})

        else:  # 不是模板文件
            error_message = "请勿修改文件名及表格格式，可尝试重新上传。"
            return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "return_upload": False, "error_message": error_message})
    else:  # 页面默认显示
        user_form = RegistrationForm()
        student_objs = User.objects.filter(is_teacher=False, is_superuser=False)

        return render(request, "edu_admin/Adm_manage_students.html", {"form": user_form, "student_objs": student_objs})


def student_download(request):
    file = open('static/file_download/student_import.xlsx', 'rb')
    response = FileResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="student_import.xlsx"'
    return response
