from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from myapp.models import Candidat, Recruteur

class MotCle(models.Model):
    mot = models.CharField(max_length=200)
    def __str__(self):
        return self.mot

class Offre(models.Model):
    intutile = models.CharField('Intitulé du poste', max_length=100)
    description = models.TextField(null=True)
    mission = models.TextField(null=True)
    date_limite = models.DateTimeField('Date limite du candidature', default=timezone.now)
    date_publication = models.DateTimeField('Date de la publication', default=timezone.now)
    recruteur = models.ForeignKey(Recruteur, on_delete=models.CASCADE)
    mot_cle = models.ManyToManyField(MotCle, verbose_name='Mots clés offre')
    def __str__(self):
        return self.intutile + " " + self.description
    class Meta:
        ordering = ['date_publication']
        

class Categorie(models.Model):
    denomination = models.CharField('Catégorie',max_length=50)
    def __str__(self):
        return self.denomination

class Specialite(models.Model):
    label = models.CharField('Spécialité', max_length=200)
    categorie = models.ForeignKey(Categorie, on_delete=models.CASCADE, default=1)
    def __str__(self):
        return self.label

class Curriculum(models.Model):
    nom_cv = models.CharField('Nom CV',max_length=200)
    chemin = models.TextField(null=True)
    date_cv = models.DateTimeField('Date de depôt CV', default=timezone.now)
    candicat = models.ForeignKey(Candidat, on_delete=models.CASCADE)
    specialites = models.ManyToManyField(Specialite)
    class Meta:
        ordering = ['date_cv']

class Postulation(models.Model):
    chemin_lettre = models.TextField(null=True)
    date_postulation = models.DateTimeField('Date postulation', default=timezone.now)
    candidat = models.ForeignKey(Candidat, on_delete = models.CASCADE, verbose_name='Candidat concerné')
    offre = models.ForeignKey(Offre, on_delete = models.CASCADE, verbose_name='Offre concerné')
    def __str__(self):
        return self.candicat + ' ' + self.offre
    class Meta:
        ordering = ['date_postulation']
        unique_together = (('candidat','offre'),)
