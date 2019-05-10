from django.contrib import admin
from .models import Offre, Categorie, MotCle, CandidatOffre

admin.site.register(Offre)
admin.site.register(Categorie)
admin.site.register(MotCle)
admin.site.register(CandidatOffre)