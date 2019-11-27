from django.db import models
from account.models import User

# class Student(models.Model):
#     stu_no = models.CharField(max_length=12, primary_key=True)
#     stu_name = models.CharField(max_length=20)
#     stu_school = models.CharField(max_length=20)
#     stu_major = models.CharField(max_length=20)
#     stu_class = models.CharField(max_length=20)
#
#     class Meta:
#         ordering = ("stu_no",)
#
#     def __str__(self):
#         return self.stu_no


class Classroom(models.Model):
    room_id = models.CharField(max_length=20, primary_key=True)
    place = models.CharField(max_length=50)
    number = models.IntegerField()
    owner = models.CharField(max_length=20)


class Course(models.Model):
    course_id = models.CharField(max_length=20, primary_key=True)
    course_name = models.CharField(max_length=20)
    course_char = models.CharField(max_length=20)
    course_belong = models.CharField(max_length=20)
    time = models.DateField(blank=True)
    place_id = models.ForeignKey(Classroom, default=None, on_delete=models.DO_NOTHING)
    teacher_id = models.ForeignKey(User, default=None, on_delete=models.DO_NOTHING)
    credit = models.IntegerField(default=0)


class Select(models.Model):
    select_id = models.IntegerField(auto_created=True)
    course_id = models.ForeignKey(Course, on_delete=models.DO_NOTHING)
    student_id = models.ForeignKey(User, on_delete=models.DO_NOTHING)
    grade = models.IntegerField(default=None)
    is_reread = models.BooleanField(default=False)

