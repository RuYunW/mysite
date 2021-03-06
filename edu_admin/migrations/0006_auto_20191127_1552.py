# Generated by Django 2.2.7 on 2019-11-27 07:52

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('edu_admin', '0005_auto_20191125_1955'),
    ]

    operations = [
        migrations.CreateModel(
            name='Classroom',
            fields=[
                ('room_id', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('place', models.CharField(max_length=50)),
                ('number', models.IntegerField()),
                ('owner', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Course',
            fields=[
                ('course_id', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('course_name', models.CharField(max_length=20)),
                ('course_char', models.CharField(max_length=20)),
                ('course_belong', models.CharField(max_length=20)),
                ('time', models.DateField(blank=True)),
                ('credit', models.IntegerField(default=0)),
                ('place_id', models.ForeignKey(default=None, on_delete=django.db.models.deletion.DO_NOTHING, to='edu_admin.Classroom')),
                ('teacher_id', models.ForeignKey(default=None, on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Select',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('select_id', models.IntegerField(auto_created=True)),
                ('grade', models.IntegerField(default=None)),
                ('is_reread', models.BooleanField(default=False)),
                ('course_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='edu_admin.Course')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.DeleteModel(
            name='Student',
        ),
    ]
