from django.db import models


class Account(models.Model):
    username = models.CharField(max_length=12, primary_key=True)  # 学号
    password = models.CharField(max_length=100)  # 密码

    class Meta:
        ordering = ("username",)

    def __str__(self):
        return self.username
