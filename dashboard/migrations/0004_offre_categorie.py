# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2019-06-27 09:45
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0003_auto_20190308_1215'),
    ]

    operations = [
        migrations.AddField(
            model_name='offre',
            name='categorie',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='dashboard.Categorie'),
        ),
    ]
