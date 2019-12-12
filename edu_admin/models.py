from django.db import models
from account.models import User


class Classroom(models.Model):
    room_id = models.CharField(max_length=20, primary_key=True)  # 教室编号
    place = models.CharField(max_length=50)   # 教室位置
    number = models.IntegerField()            # 教室容量
    owner = models.CharField(max_length=20)   # 教室归属单位

    def __str__(self):
        return self.id


class Course(models.Model):  # 基本课表
    course_id = models.CharField(max_length=20, primary_key=True)  # 课程编号
    course_name = models.CharField(max_length=20)                  # 课程名称
    course_belong = models.CharField(max_length=50, null=True)     # 课程归属
    credit = models.IntegerField(default=0)                        # 学分
    course_char = models.CharField(max_length=20)                  # 课程性质
    description = models.CharField(max_length=200, default='')     # 课程描述


class SelectCourse(models.Model):           # 开课表
    select_course_id = models.CharField(max_length=50, primary_key=True)
    course_id = models.ForeignKey(Course, on_delete=models.CASCADE)       # 如果课程删除，选课级联删除
    course_num = models.IntegerField()      # 课容量
    course_remain = models.IntegerField(default=100)   # 课余量
    time = models.CharField(max_length=50)  # 上课时间
    term = models.CharField(max_length=50)  # 开课学期
    scclass = models.CharField(max_length=100, null=True)           # 开课班级
    place_id = models.ForeignKey(Classroom, on_delete=models.CASCADE)  # 上课地点
    teacher_id = models.ForeignKey(User, on_delete=models.CASCADE)     # 授课教师

    def __str__(self):
        return self.select_course_id


class StudentSelectCourse(models.Model):  # 学生选课表
    select_id = models.CharField(max_length=50, auto_created=True, primary_key=True)             # 学生选课ID
    select_course_id = models.ForeignKey(SelectCourse, on_delete=models.DO_NOTHING)  # 开课课程代码
    student_id = models.ForeignKey(User, on_delete=models.DO_NOTHING)          # 学生学号
    score = models.IntegerField(default=None, null=True)       # 课程成绩
    is_reread = models.BooleanField(default=False)  # 重修标记
    course_id = models.ForeignKey(Course, on_delete=models.CASCADE, default='161130205')

