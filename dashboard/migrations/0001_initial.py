# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2019-03-12 02:35
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Categorie',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('denomination', models.CharField(max_length=50, verbose_name='Catégorie')),
            ],
        ),
        migrations.CreateModel(
            name='Curriculum',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom_cv', models.CharField(max_length=200, verbose_name='Nom CV')),
                ('chemin', models.TextField(null=True)),
                ('date_cv', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Date de depôt CV')),
                ('candicat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.Candidat')),
            ],
            options={
                'ordering': ['date_cv'],
            },
        ),
        migrations.CreateModel(
            name='MotCle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mot', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Offre',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('intutile', models.CharField(max_length=100, verbose_name='Intitulé du poste')),
                ('description', models.TextField(null=True)),
                ('mission', models.TextField(null=True)),
                ('date_limite', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Date limite du candidature')),
                ('date_publication', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Date de la publication')),
                ('mot_cle', models.ManyToManyField(to='dashboard.MotCle', verbose_name='Mots clés offre')),
                ('recruteur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.Recruteur')),
            ],
            options={
                'ordering': ['date_publication'],
            },
        ),
        migrations.CreateModel(
            name='Postulation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('chemin_lettre', models.TextField(null=True)),
                ('date_postulation', models.DateTimeField(default=django.utils.timezone.now, verbose_name='Date postulation')),
                ('candidat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myapp.Candidat', verbose_name='Candidat concerné')),
                ('offre', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='dashboard.Offre', verbose_name='Offre concerné')),
            ],
            options={
                'ordering': ['date_postulation'],
            },
        ),
        migrations.CreateModel(
            name='Specialite',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('label', models.CharField(max_length=200, verbose_name='Spécialité')),
                ('categorie', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='dashboard.Categorie')),
            ],
        ),
        migrations.AddField(
            model_name='curriculum',
            name='specialites',
            field=models.ManyToManyField(to='dashboard.Specialite'),
        ),
        migrations.AlterUniqueTogether(
            name='postulation',
            unique_together=set([('candidat', 'offre')]),
        ),
    ]