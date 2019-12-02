from django.db import models
from django.contrib.auth.models import AbstractUser
import datetime
import django


# class Account(models.Model):
#     username = models.CharField(max_length=12, primary_key=True)  # 学号
#     password = models.CharField(max_length=100)  # 密码
#
#     class Meta:
#         ordering = ("username",)
#
#     def __str__(self):
#         return self.username
#
#
# class UserProfile(models.Model):
#     user = models.OneToOneField(User, on_delete=models.CASCADE, unique=True)
#     major = models.CharField(max_length=50, null=False)
#
#     birth = models.DateField(blank=True, null=True)
#     phone = models.CharField(max_length=20, null=True)


class User(AbstractUser):
    username = models.CharField(max_length=20, primary_key=True, db_index=True)
    password = models.CharField(max_length=100, null=False)
    name = models.CharField(max_length=50)
    id_card = models.CharField(max_length=20)
    sex = models.CharField(max_length=2)
    school = models.CharField(max_length=20)
    major = models.CharField(max_length=20)
    sclass = models.CharField(max_length=20)
    admin_data = models.DateField(blank=True, default=django.utils.timezone.now)
    is_teacher = models.BooleanField(default=False)

    def __str__(self):
        return self.name



class Card(models.Model):
    card_id = models.CharField(max_length=20, primary_key=True)
    student_id = models.CharField(max_length=20, default=None)
    photo = models.FileField(upload_to='avatar/%Y%m%d/', default="/avatar/default_avatar.jpg")


class Abnormal(models.Model):
    username = models.CharField(max_length=20, primary_key=True)
    password = models.CharField(max_length=100, null=False)
    name = models.CharField(max_length=50)
    id_card = models.CharField(max_length=20)
    sex = models.CharField(max_length=2)
    school = models.CharField(max_length=20)
    major = models.CharField(max_length=20)
    sclass = models.CharField(max_length=20)
    admin_data = models.DateField(blank=True)
    remark = models.CharField(max_length=500)


class AbnormalView(models.Model):
    class Meta:
        managed = False
        db_table = 'account_abnormal_view'


class UserView(models.Model):
    class Meta:
        managed = True
        db_table = 'account_user_view'
