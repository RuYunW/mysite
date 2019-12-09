# Generated by Django 2.2.7 on 2019-12-04 14:47

import django.contrib.auth.models
from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0011_update_proxy_permissions'),
    ]

    operations = [
        migrations.CreateModel(
            name='Abnormal',
            fields=[
                ('username', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('password', models.CharField(max_length=100)),
                ('name', models.CharField(max_length=50)),
                ('id_card', models.CharField(max_length=20)),
                ('sex', models.CharField(max_length=2)),
                ('school', models.CharField(max_length=20)),
                ('major', models.CharField(max_length=20)),
                ('sclass', models.CharField(max_length=20)),
                ('admin_data', models.DateField(blank=True)),
                ('remark', models.CharField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='Card',
            fields=[
                ('card_id', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('student_id', models.CharField(default=None, max_length=20)),
                ('photo', models.FileField(default='/avatar/default_avatar.jpg', upload_to='avatar/%Y%m%d/')),
            ],
        ),
        migrations.CreateModel(
            name='UserView',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'account_user_view',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('first_name', models.CharField(blank=True, max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('username', models.CharField(db_index=True, max_length=20, primary_key=True, serialize=False)),
                ('password', models.CharField(max_length=100)),
                ('name', models.CharField(max_length=50)),
                ('id_card', models.CharField(max_length=20)),
                ('sex', models.CharField(max_length=2)),
                ('school', models.CharField(max_length=20)),
                ('major', models.CharField(max_length=20)),
                ('sclass', models.CharField(max_length=20)),
                ('admin_data', models.DateField(blank=True, default=django.utils.timezone.now)),
                ('is_teacher', models.BooleanField(default=False)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
    ]
