from django.db import models
from . import models

def tri_cv():
    categories = Categorie.objects.all()
    cv = Curriculum.objects.all()
    list_o = []

#Parcours de chaque categorie
    for cat in categories:
        
