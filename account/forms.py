from django import forms
from account.models import User


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)


class RegistrationForm(forms.ModelForm):
    name = forms.CharField(label="name", widget=forms.TextInput(attrs={'placeholder': u'请输入学生姓名', "class": "form-control", "id": "id", "style": "width: 200px"}))
    username = forms.CharField(label="username", widget=forms.TextInput(attrs={'placeholder': u'请输入学生学号', "class": "form-control", "id": "id", "style": "width: 200px"}))
    password = forms.CharField(label="password", widget=forms.PasswordInput(attrs={'placeholder': u'请输入学生密码', "class": "form-control", "id": "id", "style": "width: 200px"}))
    # school = forms.CharField(label="school", widget=forms.TextInput(attrs={'placeholder': u'请输入学院', "class": "form-control", "id": "id", "style": "width: 200px"}))
    major = forms.CharField(label="major", widget=forms.TextInput(attrs={'placeholder': u'请输入专业', "class": "form-control", "id": "id", "style": "width: 200px"}))
    sclass = forms.CharField(label="sclass", widget=forms.TextInput(attrs={'placeholder': u'请输入班级', "class": "form-control", "id": "id", "style": "width: 200px"}))

    class Meta:
        model = User
        fields = ("name", "username", "password", "major", "sclass")

