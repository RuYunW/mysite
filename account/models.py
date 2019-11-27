from django.db import models
from django.contrib.auth.models import User


class Account(models.Model):
    username = models.CharField(max_length=12, primary_key=True)  # 学号
    password = models.CharField(max_length=100)  # 密码

    class Meta:
        ordering = ("username",)

    def __str__(self):
        return self.username


class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, unique=True)
    major = models.CharField(max_length=50, null=False)

    birth = models.DateField(blank=True, null=True)
    phone = models.CharField(max_length=20, null=True)



