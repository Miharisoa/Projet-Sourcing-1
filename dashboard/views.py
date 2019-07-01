from django.shortcuts import render,get_object_or_404,redirect
from django.http import JsonResponse,HttpResponseRedirect
from django.core.files.storage import FileSystemStorage
from django.utils.timezone import make_aware
from django.conf import settings
from myapp.models import Candidat,Recruteur
from myapp.forms import CandidatForm
from .models import Categorie, Offre, CandidatOffre,Postulation,Curriculum
import json
from datetime import datetime,date
from django.db.models import Subquery,OuterRef

from .forms import OffreForm
from myapp.forms import CandidatForm
from django.db.models import Avg, Sum, F, Count, Max

def get_dashboard_recruteur(request):
    id = request.session['id_user']
    user = get_object_or_404(Recruteur,id=id)
    print(user.nom)
    message = ""
    poste = get_offres_recruteurs(id)
    categories = get_categories()
    liste3 = derniere_annonces()
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
    context = {
        'form': form,
        'message':message,
        'poste':poste,
        'categories':categories,
        'dernieres_annonces':liste3,
    }
    return render(request,'recruteur.html',context)


def get_dashboard_candidat(request):
    id = request.session['id_user']
    user = get_object_or_404(Candidat,id=id)
    categories = get_categories()
    offres = get_offres_id(id)
    liste = []
    for item in offres:        
        # item.offre.date_limite = make_aware(item.offre.date_limite)
        # item.offre.date_publication = make_aware(item.offre.date_publication)
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

    postulations = get_postulations_candidat(id)

    flux = get_flux_offres()
    

    form = CandidatForm()

    context ={
        'categories' : categories,
        'offres':offres,
        'user':user,
        'form_profil':form,
        'liste':json.dumps(liste, default=lambda o: o.__dict__),
        'offre_categories':json.dumps(liste2, default=lambda o: o.__dict__),
        'dernieres_annonces':liste3,
        'postulations':postulations,
        'flux_valeurs':flux['valeurs'],
        'flux_categories':flux['categories'],
    }
    return render(request,'candidat.html', context)

def uploadFile(request):
    print("upload fichier EEEEEEEEEEEEE")
    print(request.session['id_user'])
    file = request.FILES['the_file']
    fs = FileSystemStorage()
    uploaded_file_url = settings.UPLOAD_URL
    filename = fs.save(file.name, file)
    uploaded_file_url += fs.url(filename)
    print("LASA ilay FILE eeee")
    id = request.session['id_user']
    user = get_object_or_404(Candidat,id=id)
    type= request.POST['type']
    if type=="lm":
        print("LETTRE DE MOTIVATION")
        p = Postulation()
        p.chemin_lettre = uploaded_file_url
        p.candidat = user
        p.offre = get_object_or_404(Offre,id=request.POST['id_offre'])
        p.save()   
        print("postulation OK")
    elif type=="cv":
        print("CV")
        cv = Curriculum()
        cv.nom_cv = user.nom+"_"+user.prenom+"_"+filename
        cv.chemin = uploaded_file_url
        cv.candicat = user
        cv.save()
        print("upload CV OK")
    # return render(request,'dashboard-candidat.html',{})
    return redirect('/dashboard/candidat')

# changer le mail d un utilisateur
def change_email(request):
    id = request.session['id_user']
    user = get_object_or_404(Candidat,id=id)
    mail = request.POST['modif_email']
    user.mail = mail
    user.save()
    return redirect('/dashboard/candidat')

# changer l adresse de l utilisateur
def change_adress(request):
    id = request.session['id_user']
    user = get_object_or_404(Candidat,id=id)
    a = request.POST['modif_adresse']
    user.adresse = a
    user.save()
    return redirect('/dashboard/candidat')

# renouveller le profil d'un utilisateur
def change_profil(request):
    id = request.session['id_user']
    user = get_object_or_404(Candidat,id=id)
    formulaire  = CandidatForm(request.POST)
    
    if formulaire.is_valid():
        form = formulaire.save(commit=False)
        user.nom = form.nom
        user.prenom = form.prenom
        user.ddn = form.ddn
        user.sexe = form.sexe
        user.password = form.password
        user.save()

        print("valide ilay form")
    else:
        print("Tsy mety")
    return redirect('/dashboard/candidat')


# get les categories existants dans la bdd
def get_categories():
    categories = Categorie.objects.all()
    return categories
    
def get_cv_in_categorie(request, id_categorie):
    return render(request,'dashboard-recruteur.html')

# get les offres existants
def get_offres():
    offres = Offre.objects.all()
    return offres

# get les offres correspondants au profil d un utilisateur
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

# get les offres par categorie
def get_offres_par_categorie(id_categorie):
    #date_limite__gte=datetime.now()
    offres = list(Offre.objects.all().filter(categorie__id=id_categorie,date_limite__gte=datetime.now()).annotate(
        societe=Subquery(Recruteur.objects.filter(id=OuterRef('recruteur_id')).values('nom_societe'))).order_by('-date_limite'))
    return offres

# retourne la liste contenant les listes de offres par categorie
def get_offres_categories(categories):
    liste = []
    for cat in categories:
        temp = formatter(get_offres_par_categorie(cat.id))
        liste.append(temp)
    return liste

# formatter les offres
def formatter(offres):
    liste = []
    for item in offres:     
        item.date_limite = item.date_limite.strftime('%d/%m/%Y')
        item.date_publication = item.date_publication.strftime('%d/%m/%Y')       
        objet = {'offre':item,'societe':item.societe}        
        liste.append(objet)
    return liste

# get les dernieres annonces ou offres
def derniere_annonces():
    liste = list(Offre.objects.all().filter(date_limite__gte=datetime.now()).annotate(
        societe=Subquery(Recruteur.objects.filter(id=OuterRef('recruteur_id')).values('nom_societe'))).order_by('-date_publication'))[:3]
    return liste

# get les postulations qu'a fait un utilisateur
def get_postulations_candidat(id_candidat):
    liste = list(Postulation.objects.all().filter(candidat__id=id_candidat))

    return liste

def get_flux_offres():
    categories = get_categories()
    liste = []
    liste2 = []
    for cat in categories:
        nb = Offre.objects.filter(categorie__id=cat.id,date_limite__gte=datetime.now()).count()
        liste.append(nb)
        liste2.append(cat.denomination)
    objet = {'categories':liste2,'valeurs':liste}
    return objet

#get offre recruteur
def get_offres_recruteurs(id_recruteur):  #recruteur__id = request.session[id_user]
    offres_r = list(Offre.objects.all().filter(recruteur__id=id_recruteur).order_by('date_publication'))
    return offres_r

def tri_offres_id(id_candidat, mot_):
    offres_ = list(CandidatOffre.objects.select_related('offre').filter(candidat_id = id_candidat))
    return offres_
