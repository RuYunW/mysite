from django import forms
from account.models import User


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)


class RegistrationForm(forms.ModelForm):
    name = forms.CharField(label="name", widget=forms.TextInput(attrs={'placeholder': 'S', "class": "form-control", "id": "id", "style": "width: 200px"}))
    username = forms.CharField(label="username")
    password = forms.CharField(label="password", widget=forms.PasswordInput)
    school = forms.CharField(label="school")
    major = forms.CharField(label="major")
    sclass = forms.CharField(label="sclass")

    class Meta:
        model = User
        fields = ("name", "username", "password", "school", "major", "sclass")


