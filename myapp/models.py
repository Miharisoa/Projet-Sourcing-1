from django.db import models
from django.contrib.auth.models import User

from django.utils import timezone

class Personne(models.Model):
    SEXE =(
        ('M','Masculin'),
        ('F','Feminin')
    )
    nom = models.CharField(max_length=100,default="Inconnu")
    prenom = models.CharField(max_length=100,default="Inconnu")
    ddn = models.DateField("Date de naissance",default=timezone.now)
    sexe = models.CharField(max_length=1, choices=SEXE, blank=True)
    mail = models.CharField('Adresse e-mail',max_length=100,blank=True)
    password =  models.CharField('Mot de passe',max_length=100,blank=True)
    class Meta :
        abstract = True
    def __str__(self):
        return self.nom + ' ' + self.prenom

class Candidat(Personne):
    photo_profil = models.TextField('Photo de profil' , default="user.jpg")
    adresse = models.TextField('Adresse physique',blank=True)
    

class Recruteur(Personne):
    logo_societe = models.TextField('Lodo de la société', default="logo.jpg")
    nom_societe = models.CharField('Nom de la société', max_length=100, default="Anonyme")
    description = models.TextField(blank=True)
    adresse_societe = models.TextField('Adresse de la société',blank=True)

