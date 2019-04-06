from django.shortcuts import render,get_object_or_404
from myapp.models import Candidat,Recruteur
from .models import Categorie, Offre


def get_dashboard_recruteur(request):
    id = request.session['id_user']
    user = get_object_or_404(Recruteur,id=id)
    print(user.nom)
    return render(request,'recruteur.html')


def get_dashboard_candidat(request):
    id = request.session['id_user']
    user = get_object_or_404(Candidat,id=id)
    categories = get_categories()
    offres = get_offres()
    context ={
        'categories' : categories,
        'offres' : offres,
        'user':user,
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