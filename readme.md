# 教务管理系统
### 第21组

---

### 目录结构
1. `account`
	> 涉及账户管理、登入登出、登陆判断、用户信息新增修改相关功能的应用  
	> `model.py`--模型(表)  
	> `views.py`--视图(功能函数)  

2. `edu_admin`
	> 涉及选退改课、人员管理、成绩等教务管理所有相关功能的应用  
	> `model.py`--模型(表)  
	> `views.py`--视图(功能函数)  

3. `media`
	> 批量上传文件暂存位置
4. `mysite`
	> 项目管理，项目全局配置
5. `static`
	> `css`, `js`, `img`, `font`, `file`等静态文件存储位置
6. `templates`
	> 前端`*.html`文件  

7. `manage.py`
	> Django默认管理方式  

8. `middleware.py`
	> 实现登录判断，角色请求跳转中间件

9. `mysite.sql`
	> 数据库备份文件


---

### 项目特色
1. csrf认证，防止跨站请求伪造攻击
2. Django内置clean_data()，防止SQL注入
3. pbkdf_sha256动态定长加密方式，数据库密文加密
4. 批量导入，减轻用户负担
5. 四种方式——`ORM`, `游标`, `OS系统命令`, `Django内置函数`实现对数据库的不同操作，灵活快捷
