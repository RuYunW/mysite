# Generated by Django 2.2.7 on 2019-12-11 14:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0002_auto_20191211_2213'),
    ]

    operations = [
        migrations.CreateModel(
            name='ScoreCalculateView',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'score_calculate_view',
                'managed': True,
            },
        ),
    ]
