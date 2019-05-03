# Generated by Django 2.1.7 on 2019-03-07 13:20

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Candidat',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(default='Inconnu', max_length=100)),
                ('prenom', models.CharField(default='Inconnu', max_length=100)),
                ('ddn', models.DateField(default=django.utils.timezone.now, verbose_name='Date de naissance')),
                ('sexe', models.CharField(blank=True, choices=[('M', 'Masculin'), ('F', 'Feminin')], max_length=1)),
                ('mail', models.CharField(blank=True, max_length=100, verbose_name='Adresse e-mail')),
                ('password', models.CharField(blank=True, max_length=100, verbose_name='Mot de passe')),
                ('photo_profil', models.TextField(default='user.jpg', verbose_name='Photo de profil')),
                ('adresse', models.TextField(blank=True, verbose_name='Adresse physique')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.RemoveField(
            model_name='membre',
            name='utilisateur',
        ),
        migrations.RemoveField(
            model_name='recruteur',
            name='logo',
        ),
        migrations.RemoveField(
            model_name='recruteur',
            name='societe',
        ),
        migrations.RemoveField(
            model_name='recruteur',
            name='utilisateur',
        ),
        migrations.AddField(
            model_name='recruteur',
            name='adresse_societe',
            field=models.TextField(blank=True, verbose_name='Adresse de la société'),
        ),
        migrations.AddField(
            model_name='recruteur',
            name='ddn',
            field=models.DateField(default=django.utils.timezone.now, verbose_name='Date de naissance'),
        ),
        migrations.AddField(
            model_name='recruteur',
            name='logo_societe',
            field=models.TextField(default='logo.jpg', verbose_name='Lodo de la société'),
        ),
        migrations.AddField(
            model_name='recruteur',
            name='mail',
            field=models.CharField(blank=True, max_length=100, verbose_name='Adresse e-mail'),
        ),
        migrations.AddField(
            model_name='recruteur',
            name='nom',
            field=models.CharField(default='Inconnu', max_length=100),
        ),
        migrations.AddField(
            model_name='recruteur',
            name='nom_societe',
            field=models.CharField(default='Anonyme', max_length=100, verbose_name='Nom de la société'),
        ),
        migrations.AddField(
            model_name='recruteur',
            name='password',
            field=models.CharField(blank=True, max_length=100, verbose_name='Mot de passe'),
        ),
        migrations.AddField(
            model_name='recruteur',
            name='prenom',
            field=models.CharField(default='Inconnu', max_length=100),
        ),
        migrations.AddField(
            model_name='recruteur',
            name='sexe',
            field=models.CharField(blank=True, choices=[('M', 'Masculin'), ('F', 'Feminin')], max_length=1),
        ),
        migrations.DeleteModel(
            name='Membre',
        ),
    ]
