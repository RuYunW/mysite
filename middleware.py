import re
from django.http import JsonResponse
from django.shortcuts import HttpResponseRedirect
from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import render
from account.models import User


class LoginCheckMiddleware(MiddlewareMixin):
    def process_request(self, request):
        # | 分隔要匹配的多个url，从左到右匹配，有匹配就返回匹配值，否则返回None。
        # pattern = r'^(/$|/user/user/[0-9]+/$|/user/user/$|/user/getuserall|/user/get_token_code|/user/update_phone_no|/stock|/future)'
        pattern = '/edu_admin/'
        # 如果 request.path 的开始位置能够找到这个正则样式的任意个匹配，就返回一个相应的匹配对象。
        # 如果不匹配，就返回None
        match = re.search(pattern, request.path)
        username = request.session.get("username")
        print(match)
        # 需要拦截的url
        if match and not request.user.is_authenticated:  # 未登录
            print('用户未登录URL拦截 >>: ', request.path)
        # 普通用户尝试进入管理员界面
        elif match and not User.objects.get(username=username).is_superuser and re.search('/Adm', request.path):
            return render(request, "edu_admin/welcome_Stu.html")

        # 管理员尝试进入普通用户界面
        elif match and User.objects.get(username=username).is_superuser and re.search('/Stu', request.path):
            return render(request, "edu_admin/welcome_Adm.html")

        # 非拦截页面
        else:
            pass

        # ajax请求未登录
        # else:
        #     return JsonResponse({'status': False, 'info': '用户未登录!'})
