from django.shortcuts import render,get_object_or_404
from django.http import JsonResponse
from myapp.models import Candidat,Recruteur
from .models import Categorie, Offre, CandidatOffre
import json
from datetime import datetime
from django.db.models import Subquery,OuterRef

from .forms import OffreForm

def get_dashboard_recruteur(request):
    id = request.session['id_user']
    user = get_object_or_404(Recruteur,id=id)
    print(user.nom)
    message = ""
    if request.method == "POST":
        form = OffreForm(request.POST)
        print ("aiza oooooo")
        if form.is_valid():
            annonce = form.save(commit=False)
            annonce.recruteur=user
            annonce.save()
            print("SAUVE")
            message ="ok"
        else:
            message = "non"
            print("tsy sauve")
    else:
        form = OffreForm()
    return render(request,'recruteur.html',{'form': form,'message':message})


def get_dashboard_candidat(request):
    id = request.session['id_user']
    user = get_object_or_404(Candidat,id=id)
    categories = get_categories()
    offres = get_offres_id(id)
    liste = []
    for item in offres:
        item.offre.date_limite = item.offre.date_limite.strftime('%d/%m/%Y')
        item.offre.date_publication = item.offre.date_publication.strftime('%d/%m/%Y')
        # f = json.dumps(item.offre, default=lambda o: o.__dict__)
        objet = {'offre':item.offre,'societe':item.societe}
        # liste.append(item.offre)        
        liste.append(objet)
        
    context ={
        'categories' : categories,
        'offres':offres,
        'user':user,
        'liste':json.dumps(liste, default=lambda o: o.__dict__),
    }
    return render(request,'candidat.html', context)


def get_categories():
    categories = Categorie.objects.all()
    return categories
    
def get_cv_in_categorie(request, id_categorie):
    return render(request,'dashboard-recruteur.html')

def get_offres():
    offres = Offre.objects.all()
    return offres

def get_offres_id(id_candidat):
    # offres_ = list(CandidatOffre.objects.select_related('offre').filter(candidat_id = id_candidat))
    offres_= list(CandidatOffre.objects.select_related('offre').filter(candidat_id = id_candidat).annotate(
        societe=Subquery(Recruteur.objects.filter(id=OuterRef('offre__recruteur_id')).values('nom_societe'))))
    # offres_ = [{
    #     'intutile':o.offre.intutile,
    #     'description':o.offre.description,
    #     'mission':o.offre.mission,
    #     'date_limite':o.offre.date_limite.strftime('%d/%m/%Y'),
    #     'date_publication':o.offre.date_publication.strftime('%d/%m/%Y'),
    #     'mot_cle':o.offre.mot_cle,
    #     # 'id':o.offre.id,
    #     'societe':o.societe
    # }
    # for o in list(offres_query)]
    return offres_

def tri_offres_id(id_candidat, mot_):
    offres_ = list(CandidatOffre.objects.select_related('offre').filter(candidat_id = id_candidat))
    return offres_