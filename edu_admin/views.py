from django.shortcuts import render, get_object_or_404
from edu_admin import models
from django.http import FileResponse, HttpResponse, JsonResponse
from edu_admin.forms import AddCourseForm
from edu_admin.models import Course, Classroom
from account.models import User
import xlrd
from account.forms import TeacherForm
from django.views.decorators.csrf import ensure_csrf_cookie


def Adm_mng_cou(request):
    add_course_form = AddCourseForm(request.POST)

    if request.method == "POST" and request.POST.getlist("add_course_button"):
        add_course_form = AddCourseForm(request.POST)

        course_id = request.POST.get('course_id')
        print(course_id)
        print(666)
        if Course.objects.filter(course_id=course_id):
            error_message = "课程号冲突，请重新输入！"
            return render(request, "edu_admin/Adm_manage_courses.html",
                          {"form": add_course_form, "add_course_return": False, "error_message": error_message})
        course_name = request.POST.get('course_name')
        course_week = "第" + request.POST.get('begin') + "-" + request.POST.get('end') + "周"
        worktime1 = request.POST.get('workday1') + request.POST.get('workclass1')
        # 如果有第二节课
        if request.POST.get('workday2') and request.POST.get('workclass2'):
            worktime2 = request.POST.get('workday2') + request.POST.get('workclass2')
        else:
            worktime2 = ""
        worktime = worktime1 + ";" + worktime2 + "{" + course_week + "}"
        # 如果用户存在且身份为老师
        if User.objects.filter(username=request.POST.get('teacher_id')) and User.objects.get(
                username=request.POST.get('teacher_id')).is_teacher:
            teacher = User.objects.get(username=request.POST.get('teacher_id'))
        else:
            error_message = "教师不存在!"
            return render(request, "edu_admin/Adm_manage_courses.html",
                          {"form": add_course_form, "add_course_return": False, "error_message": error_message})

        credit = request.POST.get('credit')  # 学分
        course_belong = request.POST.get('course_belong')  # 课程归属
        course_char = request.POST.get('course_char')  # 课程性质

        bigLoc = request.POST.get('bigLoc')
        smallLoc = request.POST.get('smallLoc')
        place_id = request.POST.get('place_id')

        course_num = request.POST.get('course_num')
        classroom_id = bigLoc + "-" + smallLoc + "-" + place_id
        if Classroom.objects.filter(room_id=classroom_id):
            classroom = Classroom.objects.get(room_id=classroom_id)
            if int(course_num) > int(classroom.number):
                error_message = "选课人数超出教室容纳人数！"
                return render(request, "edu_admin/Adm_manage_courses.html",
                              {"form": add_course_form, "add_course_return": False, "error_message": error_message})
            else:
                pass
        else:
            error_message = "教室不存在！"
            return render(request, "edu_admin/Adm_manage_courses.html",
                          {"form": add_course_form, "add_course_return": False, "error_message": error_message})

        classroom = Classroom.objects.get(room_id=classroom_id)
        teacher = User.objects.get(username=request.POST.get('teacher_id'))
        Course.objects.create(
            course_id=course_id,
            course_name=course_name,
            course_char=course_char,
            course_belong=course_belong,
            time=worktime,
            credit=credit,
            place_id=classroom,
            course_num=course_num,
            teacher_id=teacher,
        )

        return render(request, "edu_admin/Adm_manage_courses.html",
                      {"form": add_course_form, "add_course_return": True})

    # 删除
    # elif request.method == "POST" and request.POST.getlist("course_delete_button"):
    #     add_course_form = AddCourseForm(request.POST)
    #     course_id = request.POST.get('course_id')
    #     if Course.objects.filter(course_id=course_id):
    #         course_info = Course.objects.get(course_id=course_id).course_name
    #         warning_message = "是否删除课程："+course_id+"-"+course_info
    #         return render(request, "edu_admin/Adm_manage_courses.html",
    #                       {"form": add_course_form, "add_course_return": "Ask", "warning_message": warning_message})
    #     else:
    #         error_message = "课程不存在！"
    #         return render(request, "edu_admin/Adm_manage_courses.html",
    #                       {"form": add_course_form, "add_course_return": False, "error_message": error_message})

    # 查找
    elif request.method == "POST" and request.POST.getlist("course_search_button"):
        add_course_form = AddCourseForm(request.POST)
        course_id = request.POST.get('course_id')
        print(666)
        print(course_id)
        if Course.objects.filter(course_id=course_id):

            course_obj = Course.objects.get(course_id=course_id)
            course_name = course_obj.course_name
            teacher_name = User.objects.get(username=course_obj.teacher_id).name
            credit = course_obj.credit
            course_time = course_obj.time
            course_place = Classroom.objects.get(room_id=course_obj.place_id_id)

            return render(request, "edu_admin/Adm_manage_courses.html",
                          {"form": add_course_form, "search_course_return": True, "course_name": course_name,
                           "teacher_name": teacher_name, "credit": credit, "course_time": course_time,
                           "classroom": course_place})
        else:
            error_message = "查询无果！"
            return render(request, "edu_admin/Adm_manage_courses.html",
                          {"form": add_course_form, "search_course_return": False, "error_message": error_message})

    # 批量上传
    elif request.method == "POST" and request.POST.getlist('file_button'):
        lines = []
        error_list = []
        myFile = request.FILES.get("myfile", None)
        error_message = ""
        if not myFile:
            error_message = "no files for upload!"
            return render(
                request,
                "edu_admin/Adm_manage_courses.html",
                {"form": add_course_form, "upload": False, "error_message": error_message})

        if myFile.name == 'course_import.xlsx':  # 如果是模板文件
            destination = open('media/' + myFile.name, 'wb+')
            for chunk in myFile.chunks():
                destination.write(chunk)
            destination.close()
            # 读
            x1 = xlrd.open_workbook("media/course_import.xlsx")
            table = x1.sheet_by_index(0)
            nrows = table.nrows

            if nrows <= 1:
                error_message = "文件为空，批量导入失败！"
                return render(
                    request,
                    "edu_admin/Adm_manage_courses.html",
                    {"form": add_course_form, "upload": False, "error_message": error_message})

            else:  # 不为空
                for row in range(1, nrows):
                    if Course.objects.filter(course_id=table.cell_value(row, 0)) \
                            or not Classroom.objects.filter(room_id=table.cell_value(row, 6)) \
                            or not User.objects.filter(username=table.cell_value(row, 8)) \
                            or not User.objects.get(username=table.cell_value(row, 8)).is_teacher:
                        error_list.append(table.cell_value(row, 0) + ":" + table.cell_value(row, 1) + ",")

                    else:  # 不产生冲突，记录插入值
                        lines.append({"course_id": table.cell_value(row, 0),
                                      "course_name": table.cell_value(row, 1),
                                      "course_char": table.cell_value(row, 2),
                                      "course_belong": table.cell_value(row, 3),
                                      "time": table.cell_value(row, 4),
                                      "credit": table.cell_value(row, 5),
                                      "room_id": table.cell_value(row, 6),
                                      "course_num": table.cell_value(row, 7),
                                      "teacher_id": table.cell_value(row, 8)})
                # 写入数据库
                if len(lines) > 0:  # 如果工作队列lines有数据，存入数据库
                    for item in lines:
                        classroom = Classroom.objects.get(room_id=item['room_id'])
                        Course.objects.create(
                            course_id=item["course_id"],
                            course_name=item['course_name'],
                            course_char=item['course_char'],
                            course_belong=item['course_belong'],
                            time=item['time'],
                            credit=item['credit'],
                            place_id=classroom,
                            course_num=item['credit'],
                            teacher_id=User.objects.get(username=item['teacher_id'])
                        )

                error_message = "共上传" + str(nrows - 1) + "门课程，成功" + str(len(lines)) + "门，失败" + str(
                    len(error_list)) + "门，失败课程名单如下："

                for i in error_list:
                    error_message += i
                print(error_message)
                return render(
                    request,
                    "edu_admin/Adm_manage_courses.html",
                    {"form": add_course_form, "upload": True, "error_message": error_message})

        else:  # 不是模板文件
            error_message = "请勿修改文件名及表格格式，可尝试重新上传。"
            return render(request,
                          "edu_admin/Adm_manage_courses.html",
                          {"form": add_course_form, "upload": False, "error_message": error_message})

    else:
        add_course_form = AddCourseForm()
        # student_objs = User.objects.filter(is_teacher=False)
        return render(request,
                      "edu_admin/Adm_manage_courses.html",
                      {"form": add_course_form})


def Adm_mng_stu(requset):
    return render(requset, 'edu_admin/Adm_manage_students.html', )


def Adm_mng_tea(requset):
    if requset.method == "POST" and requset.POST.getlist("add_teacher"):
        teacher_form = TeacherForm(requset.POST)

        if User.objects.filter(username=requset.POST.get("username")):
            error_message = "添加失败！用户已存在！"
            return render(requset,
                          'edu_admin/Adm_manage_teachers.html',
                          {"form": teacher_form, "add_teacher": False, "error_message": error_message})
        else:

            User.objects.create(
                username=requset.POST.get("username"),
                password=requset.POST.get("username")[-6:],
                name=requset.POST.get("name"),
                school=requset.POST.get("school"),
                major=requset.POST.get("school"),
                sclass=requset.POST.get("sclass"),
                is_teacher=True
            )
            return render(requset,
                          'edu_admin/Adm_manage_teachers.html',
                          {"form": teacher_form, "add_teacher": True})
    else:
        teacher_form = TeacherForm()
        return render(requset, 'edu_admin/Adm_manage_teachers.html', {"form": teacher_form})


def index(requset):
    return render(requset, 'edu_admin/index.html', )


# def stu_name(request):
#     stus = Student.objects.all()
#     return render(request, "edu_admin/names.html", {"stus": stus})

# def stu_info(request, stu_no):
#     # stu = Student.objects.get(stu_no=stu_no)
#     stu = get_object_or_404(Student, stu_no=stu_no)
#     school = stu.stu_school
#     major = stu.stu_major
#     sclass = stu.stu_class
#     return render(request, "edu_admin/info.html", {"stu": stu, "school": school, "major": major, "sclass": sclass})

def stu_ele_select(request):
    return render(request, "edu_admin/Stu_elective_selected.html", )


def stu_mod_info(requset):
    return render(requset, 'edu_admin/Stu_modify_information.html', )


def stu_my_sch(request):
    return render(request, "edu_admin/Stu_my_schedule.html", )


def stu_my_grade(request):
    return render(request, "edu_admin/Stu_my_grade.html", )


def stu_req_selected(request):
    return render(request, "edu_admin/Stu_required_selected.html", )


def stu_select_src(request):
    return render(request, "edu_admin/Stu_select_sourses.html", )


def wel_adm(requset):
    return render(requset, 'edu_admin/welcome_Adm.html', )


def wel_stu(request):
    # stu = get_object_or_404(Student, stu_no=stu_no)
    # name = stu.stu_name
    return render(request, "edu_admin/welcome_Stu.html", )


def course_download(request):
    file = open('static/file_download/course_import.xlsx', 'rb')
    response = FileResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="course_import.xlsx"'
    return response
