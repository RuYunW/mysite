from django.shortcuts import render, get_object_or_404
from edu_admin import models
from django.http import FileResponse, HttpResponse, JsonResponse
from edu_admin.forms import AddCourseForm
from edu_admin.models import Course, Classroom, SelectCourse, StudentSelectCourse, StuTeaCouView
from account.models import User
import xlrd
from account.forms import TeacherForm
from django.views.decorators.csrf import ensure_csrf_cookie
from django.contrib.auth.hashers import make_password
from django.db.models import Q
import os
import pymysql
from django.db import connection


def Adm_mng_cou(request):
    add_course_form = AddCourseForm(request.POST)
    if request.method == "POST" and request.POST.getlist("add_course_button"):  # 添加课程
        add_course_form = AddCourseForm(request.POST)
        course_id = request.POST.get('course_id')

        if Course.objects.filter(course_id=course_id):  # 课程已存在
            course_week = "第" + request.POST.get('begin') + "-" + request.POST.get('end') + "周"
            worktime1 = request.POST.get('workday1') + request.POST.get('workclass1')
            # 如果有第二节课
            if request.POST.get('workday2') and request.POST.get('workclass2'):
                worktime2 = request.POST.get('workday2') + request.POST.get('workclass2')
            else:
                worktime2 = ""
            worktime = worktime1 + ";" + worktime2 + "{" + course_week + "}"
            bigLoc = request.POST.get('bigLoc')
            smallLoc = request.POST.get('smallLoc')
            place_id = request.POST.get('place_id')
            classroom_id = bigLoc + "-" + smallLoc + "-" + place_id
            if Classroom.objects.filter(room_id=classroom_id) \
                    and User.objects.filter(username=request.POST.get("teacher_id")) \
                    and User.objects.get(username=request.POST.get("teacher_id")).is_teacher:  # 如果教室存在并且教师存在
                if SelectCourse.objects.filter(course_id=course_id):  # 已存在
                    SelectCourse.objects.create(
                        select_course_id=
                        "(" + str(request.POST.get("term")) + ")" + "-"
                        + str(request.POST.get("course_id")) + "-"
                        + str(request.POST.get("teacher_id")) + "-"
                        + str(len(SelectCourse.objects.filter(course_id=course_id)) + 1),
                        course_id=Course.objects.get(course_id=course_id),
                        course_num=request.POST.get("course_num"),  # 课容量
                        course_remain=request.POST.get("course_num"),  # 课余量
                        time=worktime,
                        term=request.POST.get("term"),
                        scclass=request.POST.getlist("scclass"),
                        place_id=Classroom.objects.get(room_id=classroom_id),
                        teacher_id=User.objects.get(username=request.POST.get("teacher_id"))
                    )
                    print(444)
                else:  # 没有重复课程
                    SelectCourse.objects.create(
                        select_course_id=
                        "(" + str(request.POST.get("term")) + ")" + "-"
                        + str(request.POST.get("course_id")) + "-"
                        + str(request.POST.get("teacher_id")) + "-"
                        + "1",
                        course_id=Course.objects.get(course_id=course_id),
                        course_num=request.POST.get("course_num"),
                        course_remain=request.POST.get("course_num"),
                        time=worktime,
                        term=request.POST.get("term"),
                        scclass=request.POST.getlist("scclass"),
                        place_id=Classroom.objects.get(room_id=classroom_id),
                        teacher_id=User.objects.get(username=request.POST.get("teacher_id"))
                    )
                    print(555)
                return render(request,
                              "edu_admin/Adm_manage_courses.html",
                              {"form": add_course_form, "add_course_return": True})
            else:
                error_message = "教室或教师不存在"
                return render(request, "edu_admin/Adm_manage_courses.html",
                              {"form": add_course_form, "add_course_return": False, "error_message": error_message})

        else:  # 课程不存在
            # 先创建课程
            Course.objects.create(
                course_id=request.POST.get("course_id"),
                course_name=request.POST.get("course_name"),
                course_belong=request.POST.get('course_belong'),
                credit=request.POST.get("credit"),
                course_char=request.POST.get("course_char")
            )

            # 再新建开课
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

            bigLoc = request.POST.get('bigLoc')
            smallLoc = request.POST.get('smallLoc')
            place_id = request.POST.get('place_id')

            course_num = request.POST.get('course_num')
            classroom_id = bigLoc + "-" + smallLoc + "-" + place_id
            if Classroom.objects.filter(room_id=classroom_id):
                classroom = Classroom.objects.get(room_id=classroom_id)
                if int(course_num) > int(classroom.number):
                    error_message = "课容量超出教室容纳人数！"
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
            SelectCourse.objects.create(
                select_course_id=
                "(" + request.POST.get("term") + ")" + "-"
                + request.POST.get("teacher_id") + "-"
                + str(len(SelectCourse.objects.filter(course_id=request.POST.get("course_id"))) + 1),
                course_id=Course.objects.get(course_id=request.POST.get("course_id")),
                course_num=request.POST.get("course_num"),
                course_remain=request.POST.get("course_num"),
                time=worktime,
                term=request.POST.get("term"),
                scclass=request.POST.getlist("scclass"),
                place_id=classroom,
                teacher_id=teacher
            )
            print(request.POST.getlist("scclass"))
            print(666)
            return render(
                request,
                "edu_admin/Adm_manage_courses.html",
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
                    if Course.objects.filter(course_id=str(table.cell_value(row, 0))) \
                            or not Classroom.objects.filter(room_id=str(table.cell_value(row, 6))) \
                            or not User.objects.filter(username=str(table.cell_value(row, 8))) \
                            or not User.objects.get(username=str(table.cell_value(row, 8))).is_teacher:
                        error_list.append(str(table.cell_value(row, 0)) + ":" + str(table.cell_value(row, 1)) + ",")

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
                            course_num=item['course_num'],
                            course_remain=item['course_num'],
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

    elif request.method == "POST" and request.POST.getlist('delete'):

        StudentSelectCourse.objects.filter(select_course_id=request.POST.get("delete")).delete()
        # print(request.POST.get("delete"))

        conn = pymysql.connect(host='localhost', user='root', password='MyNewPass4!', database='mysite', charset='utf8')
        cur = conn.cursor()
        cur.callproc('Sdu_delete_course', (request.POST.get("delete"),))
        conn.commit()
        error_message = '删除成功！'
        return render(request,
                      "edu_admin/Adm_manage_courses.html",
                      {"form": add_course_form, "upload": False, "error_message": error_message})



    else:
        add_course_form = AddCourseForm()
        # student_objs = User.objects.filter(is_teacher=False)
        courses = SelectCourse.objects.all()
        teacher_name = []
        for course in courses:
            if User.objects.filter(username=course.teacher_id):
                teacher_name.append(User.objects.get(username=course.teacher_id).name)
        return render(request,
                      "edu_admin/Adm_manage_courses.html",
                      {"form": add_course_form, "courses": courses, "teacher_name": teacher_name,
                       "N": str(len(courses))})


def Adm_mng_stu(requset):
    return render(requset, 'edu_admin/Adm_manage_students.html', )


def Adm_sel_time(request):
    return render(request, "edu_admin/Adm_select_time.html")


def Adm_inp_time(request):
    return render(request, "edu_admin/Adm_input_time.html")


def Adm_mng_tea(request):
    if request.method == "POST" and request.POST.getlist("add_teacher"):
        teacher_form = TeacherForm(request.POST)

        if User.objects.filter(username=request.POST.get("username")):
            error_message = "添加失败！用户已存在！"
            return render(request,
                          'edu_admin/Adm_manage_teachers.html',
                          {"form": teacher_form, "add_teacher": False, "error_message": error_message})
        else:
            User.objects.create(
                username=request.POST.get("username"),
                password=make_password(request.POST.get("username")[-6:]),
                name=request.POST.get("name"),
                school=request.POST.get("school"),
                major=request.POST.get("major"),
                sclass=request.POST.get("sclass"),
                is_teacher=True
            )
            return render(request,
                          'edu_admin/Adm_manage_teachers.html',
                          {"form": teacher_form, "add_teacher": True})

    # 查询
    elif request.method == "POST" and request.POST.getlist("select_teacher"):
        username = request.POST.get("username")
        teacher_form = TeacherForm(request.POST)
        # 查询成功
        if User.objects.filter(username=username) and User.objects.get(username=username).is_teacher:
            user = User.objects.get(username=username)
            return render(request, "edu_admin/Adm_manage_teachers.html",
                          {"form": teacher_form, "return_select": True, "user": user})
        # 查询失败
        else:
            return render(request, "edu_admin/Adm_manage_teachers.html", {"form": teacher_form, "return_select": False})


    # 批量上传
    elif request.method == "POST" and request.POST.getlist('file_button'):
        teacher_form = TeacherForm(request.POST)
        lines = []
        error_list = []
        myFile = request.FILES.get("myfile", None)
        error_message = ""
        if not myFile:
            error_message = "no files for upload!"
            return render(
                request,
                "edu_admin/Adm_manage_teachers.html",
                {"form": teacher_form, "upload": False, "error_message": error_message})

        if myFile.name == 'teacher_import.xlsx':  # 如果是模板文件
            destination = open('media/' + myFile.name, 'wb+')
            for chunk in myFile.chunks():
                destination.write(chunk)
            destination.close()
            # 读
            x1 = xlrd.open_workbook("media/teacher_import.xlsx")
            table = x1.sheet_by_index(0)
            nrows = table.nrows

            if nrows <= 1:
                error_message = "文件为空，批量导入失败！"
                return render(
                    request,
                    "edu_admin/Adm_manage_teachers.html",
                    {"form": teacher_form, "upload": False, "error_message": error_message})

            else:  # 不为空
                for row in range(1, nrows):
                    if User.objects.filter(username=table.cell_value(row, 0)):  # 如果已经存在
                        error_list.append(table.cell_value(row, 0) + ":" + table.cell_value(row, 1) + ",")

                    else:  # 不产生冲突，记录插入值
                        lines.append({"username": table.cell_value(row, 0),
                                      "name": table.cell_value(row, 1),
                                      "sex": table.cell_value(row, 2),
                                      "school": table.cell_value(row, 3),
                                      "major": table.cell_value(row, 4),
                                      "sclass": table.cell_value(row, 5),
                                      "join_date": table.cell_value(row, 6),
                                      })
                # 写入数据库
                if len(lines) > 0:  # 如果工作队列lines有数据，存入数据库
                    for item in lines:
                        User.objects.create(
                            username=item["username"],
                            name=item['name'],
                            sex=item['sex'],
                            school=item['school'],
                            major=item['major'],
                            sclass=item['sclass'],
                            admin_data=item['join_date'],
                            is_teacher=1,
                            password=make_password(item['username'][-6:])
                        )

                error_message = "共上传" + str(nrows - 1) + "人，成功" + str(len(lines)) + "人，失败" + str(
                    len(error_list)) + "人，失败人员名单如下："

                for i in error_list:
                    error_message += i
                print(error_message)
                return render(
                    request,
                    "edu_admin/Adm_manage_teachers.html",
                    {"form": teacher_form, "upload": True, "error_message": error_message})

        else:  # 不是模板文件
            teacher_form = TeacherForm(request.POST)
            error_message = "请勿修改文件名及表格格式，可尝试重新上传。"
            return render(request,
                          "edu_admin/Adm_manage_teachers.html",
                          {"form": teacher_form, "upload": False, "error_message": error_message})

    else:
        teacher_form = TeacherForm()
        teacher_objs = User.objects.filter(is_teacher=1)

        return render(request, 'edu_admin/Adm_manage_teachers.html',
                      {"form": teacher_form, "teacher_list": teacher_objs})


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
    username = request.session.get("username")
    grage_objs = StudentSelectCourse.objects.filter(Q(student_id=username) & ~Q(score=None))
    return render(request, "edu_admin/Stu_my_grade.html", {"grade_objs": grage_objs})


def stu_req_selected(request):
    username = request.session.get("username")
    course_info_objs = StudentSelectCourse.objects.filter(student_id=username)

    return render(request, "edu_admin/Stu_required_selected.html", {"course_info_objs": course_info_objs})


def stu_select_src(request):
    courses = Course.objects.all()
    if StudentSelectCourse.objects.filter(student_id=request.session.get("username")):  # 如果能查询到学生选课
        stu_select_objs = StudentSelectCourse.objects.filter(student_id=request.session.get("username"))
        credit_sum = 0
        for obj in stu_select_objs:
            credit_sum += obj.select_course_id.course_id.credit
    else:
        credit_sum = 0

    return render(request, "edu_admin/Stu_select_sourses.html", {"courses": courses, "credit_sum": credit_sum})


def stu_course_detailed(request, course_id):
    course_objs = SelectCourse.objects.filter(course_id=course_id)
    course_been_select_obj = StudentSelectCourse.objects.filter(student_id=request.session.get("username"),
                                                                course_id=course_id)

    if course_objs:  # 课程存在
        if request.method == "POST" and request.POST.getlist("select_button"):
            # print(request.POST.get("select"))
            if request.POST.get("select"):  # 如果选课valid
                # 如果已有相同课程, 删除
                if StudentSelectCourse.objects.filter(Q(select_course_id=request.POST.get("select")) & Q(student_id=request.session.get("username"))):
                    StudentSelectCourse.objects.filter(Q(course_id=request.POST.get("select").split('-')[3]) & Q(student_id=request.session.get("username"))).delete()
                StudentSelectCourse.objects.create(  # 创建记录
                    select_id=str(request.POST.get("select")) + "-" + str(request.session.get("username")),
                    select_course_id=SelectCourse.objects.get(select_course_id=request.POST.get("select")),
                    student_id=User.objects.get(username=request.session.get("username")),
                    course_id=Course.objects.get(course_id=course_id)
                )
                # SelectCourse.objects.filter(select_course_id=request.POST.get("select")).update(course_remain=)  # 课余量-1

                return render(request, "edu_admin/Stu_course_detailed.html/",
                              {"course_state": True,
                               "course_objs": course_objs,
                               "is_select": True,
                               "course_been_select_obj": course_been_select_obj[0], "course_id": course_id})

            else:  # 没选
                error_message = "您未提交选课"
                return render(request, "edu_admin/Stu_course_detailed.html/",
                              {"error_message": error_message, "course_objs": course_objs, "course_id": course_id})

            # return render(request, "edu_admin/Stu_course_detailed.html/", {"course_state": True, "course_objs": course_objs})

        # 退课
        elif request.method == "POST" and request.POST.getlist("delete_button"):
            StudentSelectCourse.objects.filter(student_id=request.session.get("username"), course_id=course_id).delete()
            return_message = "退课成功"
            course_been_select_obj = None
            return render(request, "edu_admin/Stu_course_detailed.html/",
                          {"is_delete": True,
                           "course_state": True,
                           "course_objs": course_objs,
                           "course_been_select_obj": course_been_select_obj, "course_id": course_id})

        else:
            # print(course_been_select_obj[0].select_course_id.select_course_id)
            if course_been_select_obj:
                return render(request, "edu_admin/Stu_course_detailed.html/",
                              {"course_state": True,
                               "course_objs": course_objs,
                               "course_been_select_obj": course_been_select_obj[0], "course_id": course_id})
            else:
                return render(request, "edu_admin/Stu_course_detailed.html/",
                              {"course_state": True,
                               "course_objs": course_objs,
                               "course_been_select_obj": course_been_select_obj, "course_id": course_id})

    else:  # 课程不存在
        error_message = "暂无可选课程"
        return render(request, "edu_admin/Stu_course_detailed.html/",
                      {"course_state": False, "error_message": error_message, "course_id": course_id})


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


def teacher_download(request):
    file = open('static/file_download/teacher_import.xlsx', 'rb')
    response = FileResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="teacher_import.xlsx"'
    return response


def tea_student_grade(request):
    username = request.session.get("username")
    grade_objs = StudentSelectCourse.objects.filter(Q(student_id=username) & ~Q(score=None))
    return render(request, "edu_admin/Stu_my_grade.html", {"grade_objs": grade_objs})


def tea_my_sch(request):
    return render(request, "edu_admin/Tea_my_schedule.html")


def tea_student(request):
    teacher_id = request.session.get("username")  # 教工号
    tea_course_objs = SelectCourse.objects.filter(teacher_id=teacher_id)

    if tea_course_objs:  # 如果有授课
        stu_sel_cou_objs = StuTeaCouView.objects.filter(teacher_id_id=request.session.get("username"))
        cursor = connection.cursor()  # 获取游标对象
        cursor.execute("SELECT tea_all_sum(\'" + teacher_id + "\');")
        items_num = cursor.fetchall()[0][0]
        return render(
            request,
            "edu_admin/Tea_student.html",
            {"stu_sel_cou_objs": stu_sel_cou_objs, "course_num": len(tea_course_objs), "items_num": items_num}
        )
    else:
        return render(request, "edu_admin/Tea_student.html", {"course_num": 0, "items_num": 0})


def tea_student_grade(request):
    stu_sel_cou_objs = StuTeaCouView.objects.filter(teacher_id_id=request.session.get("username"))
    if request.method == "POST":
        score = request.POST.get("score")
        print(score)
        print(request.POST.get("course_id"))
        print(request.POST.get("student_id"))
        print()
        StudentSelectCourse.objects.filter(Q(select_course_id_id=request.POST.get("course_id")) & Q(
            student_id_id=request.POST.get("student_id"))).update(score=score)

        # StuTeaCouView.objects.filter(select_course_id_id=request.POST.get("score_button"),
        #                              student_id=request.POST.get("student_id")).update(score=score)
        return_score = True
        return render(request, "edu_admin/Tea_student_grade.html",
                      {"stu_tea_cou_objs": stu_sel_cou_objs, "return_score": return_score})
    else:
        return render(request, "edu_admin/Tea_student_grade.html", {"stu_tea_cou_objs": stu_sel_cou_objs})


def welcome_tea(request):
    return render(request, "edu_admin/welcome_Tea.html")


def Adm_sdu_alt(request, student_id):  # 修改学生信息
    stu_obj = User.objects.get(username=student_id)

    if request.method == "POST":  # 表单提交
        # 修改学生信息
        User.objects.filter(username=student_id).update(
            name=request.POST.get("sdu_name"),
            major=request.POST.get("sdu_major"),
            sclass=request.POST.get("sdu_class"),
        )
        return_message = "信息修改成功！"
        return render(
            request,
            "edu_admin/Adm_student_alter.html",
            {"stu_obj": stu_obj, "return_message": return_message, "student_id": student_id})

    else:  # 正常访问
        return render(request, "edu_admin/Adm_student_alter.html", {"stu_obj": stu_obj, "student_id": student_id})


def Adm_tea_alt(request, teacher_id):
    tea_obj = User.objects.get(username=teacher_id)

    if request.method == "POST":  # 表单提交
        # 修改教师信息
        User.objects.filter(username=teacher_id).update(
            name=request.POST.get("tea_name"),
            major=request.POST.get("tea_major"),
            school=request.POST.get("tea_school"),
        )
        return_message = "信息修改成功！"
        return render(
            request,
            "edu_admin/Adm_teacher_alter.html",
            {"tea_obj": tea_obj, "return_message": return_message, "teacher_id": teacher_id})

    else:  # 正常访问
        return render(request, "edu_admin/Adm_teacher_alter.html", {"tea_obj": tea_obj, "teacher_id": teacher_id})

    # return render(request,"edu_admin/Adm_teacher_alter.html")


def Adm_cou_alt(request, course_select_id):
    cou_obj = SelectCourse.objects.get(select_course_id=course_select_id)

    if request.method == "POST":  # 表单提交
        # 修改课程信息
        if User.objects.filter(username="cou_tea_id") and Classroom.objects.filter(
                room_id=request.POST.get("cou_place_id")):
            SelectCourse.objects.filter(select_course_id=course_select_id).update(
                course_num=request.POST.get("cou_num"),
                teacher_id=User.objects.get(username="cou_tea_id"),
                place_id=Classroom.objects.get(room_id=request.POST.get("cou_place_id"))
            )
            return_message = "信息修改成功！"
        else:
            return_message = "教师或教师不存在"
        return render(
            request,
            "edu_admin/Adm_course_alter.html",
            {"cou_obj": cou_obj, "return_message": return_message, "course_select_id": course_select_id})

    else:  # 正常访问
        return render(request, "edu_admin/Adm_course_alter.html",
                      {"cou_obj": cou_obj, "course_select_id": course_select_id})

    # return render(request, "edu_admin/Adm_course_alter.html")


def Adm_ba_re(request):
    if request.method == "POST" and request.POST.getlist('backup'):
        print(os.system('mysqldump -uroot -pMyNewPass4! mysite > mysite.sql '))
        return_message = '备份成功'
        return render(
            request,
            "edu_admin/Adm_backup_restore.html",
            {"return_message": return_message}
        )
    elif request.method == "POST" and request.POST.getlist('restore'):
        print(os.system('mysql -uroot -pMyNewPass4! mysite < mysite.sql'))
        return_message = '还原成功'
        return render(
            request,
            "edu_admin/Adm_backup_restore.html",
            {"return_message": return_message}
        )
    else:
        return render(
            request,
            "edu_admin/Adm_backup_restore.html",
        )
