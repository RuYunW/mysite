from django import forms
from edu_admin.models import Course, SelectCourse


class AddCourseForm(forms.ModelForm):
    # course_name = forms.CharField(label="course_name", widget=forms.TextInput(attrs={'placeholder': u'请输入课程名称', "class": "form-control", "id": "id", "style": "width: 200px"}))
    course_id = forms.CharField(label="course_id", widget=forms.TextInput(attrs={'placeholder': u'请输入课程代码', "class": "form-control", "id": "id", "style": "width: 200px"}))
    # time = forms.CharField(label="time", widget=forms.TextInput(attrs={'placeholder': u'请输入上课时间', "class": "form-control", "id": "id", "style": "width: 200px"}))
    place_id = forms.CharField(label="place_id", widget=forms.TextInput(attrs={'placeholder': u'教室门牌号', "class": "form-control", "id": "id", "style": "width: 200px"}))
    teacher_id = forms.CharField(label="teacher_id", widget=forms.TextInput(attrs={'placeholder': u'授课教师教工号', "class": "form-control", "id": "id", "style": "width: 200px"}))
    course_num = forms.CharField(label="course_num", widget=forms.TextInput(attrs={'placeholder': u'请输入课容量', "class": "form-control", "id": "id", "style": "width: 200px"}))
    # course_belong = forms.CharField(label="course_belong", widget=forms.TextInput(attrs={'placeholder': u'请输入课归属', "class": "form-control", "id": "id", "style": "width: 200px"}))
    # course_char = forms.CharField(label="course_char", widget=forms.TextInput(attrs={'placeholder': u'请输入课性质', "class": "form-control", "id": "id", "style": "width: 200px"}))
    # credit = forms.CharField(label="credit", widget=forms.TextInput(attrs={'placeholder': u'请输入课学分', "class": "form-control", "id": "id", "style": "width: 200px"}))

    class Meta:
        model = SelectCourse
        fields = ("course_id", "place_id", "teacher_id", "course_num")
