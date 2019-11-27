from django import forms
from account.models import User


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)


class RegistrationForm(forms.ModelForm):
    name = forms.CharField(label="name", widget=forms.TextInput(attrs={'placeholder': 'Search'}))
    username = forms.CharField(label="username")
    password = forms.CharField(label="password", widget=forms.PasswordInput)
    school = forms.CharField(label="school")
    major = forms.CharField(label="major")
    sclass = forms.CharField(label="sclass")


