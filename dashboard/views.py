from django.shortcuts import render,get_object_or_404
from django.http import JsonResponse
from myapp.models import Candidat,Recruteur
from .models import Categorie, Offre, CandidatOffre
import json
from datetime import datetime,date
from django.db.models import Subquery,OuterRef

from .forms import OffreForm
from myapp.forms import CandidatForm

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
        objet = {'offre':item.offre,'societe':item.societe}
        liste.append(objet)

    liste2 = []
    liste_categories = get_offres_categories(categories)
    for lst in liste_categories:
        liste2.append(json.dumps(lst, default=lambda o: o.__dict__))
    print("DATA LOADED")

    liste3 = derniere_annonces()

    form = CandidatForm()

    context ={
        'categories' : categories,
        'offres':offres,
        'user':user,
        'form_profil':form,
        'liste':json.dumps(liste, default=lambda o: o.__dict__),
        'offre_categories':json.dumps(liste2, default=lambda o: o.__dict__),
        'dernieres_annonces':liste3,
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
    offres_= list(CandidatOffre.objects.select_related('offre').filter(candidat_id = id_candidat,offre__date_limite__gte=datetime.now()).annotate(
        societe=Subquery(Recruteur.objects.filter(id=OuterRef('offre__recruteur_id')).values('nom_societe'))).order_by('-offre__date_limite'))
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

def get_offres_par_categorie(id_categorie):
    #date_limite__gte=datetime.now()
    offres = list(Offre.objects.all().filter(categorie__id=id_categorie,date_limite__gte=datetime.now()).annotate(
        societe=Subquery(Recruteur.objects.filter(id=OuterRef('recruteur_id')).values('nom_societe'))).order_by('-date_limite'))
    return offres

def get_offres_categories(categories):
    liste = []
    for cat in categories:
        temp = formatter(get_offres_par_categorie(cat.id))
        liste.append(temp)
    return liste

def formatter(offres):
    liste = []
    for item in offres:     
        item.date_limite = item.date_limite.strftime('%d/%m/%Y')
        item.date_publication = item.date_publication.strftime('%d/%m/%Y')       
        objet = {'offre':item,'societe':item.societe}        
        liste.append(objet)
    return liste

def derniere_annonces():
    liste = list(Offre.objects.all().filter(date_limite__gte=datetime.now()).annotate(
        societe=Subquery(Recruteur.objects.filter(id=OuterRef('recruteur_id')).values('nom_societe'))).order_by('-date_publication'))[:3]
    return liste

def tri_offres_id(id_candidat, mot_):
    offres_ = list(CandidatOffre.objects.select_related('offre').filter(candidat_id = id_candidat))
    return offres_