# Generated by Django 2.2.7 on 2019-11-27 11:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('edu_admin', '0007_select_test'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='select',
            name='test',
        ),
    ]
