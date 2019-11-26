# Generated by Django 2.2.7 on 2019-11-25 11:55

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Account',
            fields=[
                ('username', models.CharField(max_length=12, primary_key=True, serialize=False)),
                ('password', models.CharField(max_length=100)),
            ],
            options={
                'ordering': ('username',),
            },
        ),
    ]
