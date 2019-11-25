from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User


class Student(models.Model):
    stu_no = models.IntegerField(max_length=12, primary_key=True)
    stu_name = models.CharField(max_length=8)
    stu_school = models.CharField(max_length=20)
    stu_major = models.CharField(max_length=20)
    stu_class = models.CharField(max_length=20)

    class Meta:
        ordering = ("stu_no",)

    def __str__(self):
        return self.stu_no


class StudentAccount(models.Model):
    id = models.IntegerField(max_length=12, primary_key=True)
    name = models.CharField(max_length=20)
