from django.shortcuts import render
from django.contrib.auth.models import User
from django.http import JsonResponse
from . import MyEncoder
import json
from myapp.models import Candidat,Recruteur
from django.contrib.auth.hashers import check_password, make_password

def index(request):
    return render(request,'sourcingapp/index.html')

def home(request):
    password = request.POST['email']
    print(password)    
    return render(request,'index.html')

def create_new_account(request):
    print('ato enao')
    nom = request.POST['nom']
    prenom = request.POST['prenom']
    mail = request.POST['email']
    password = request.POST['mdp']
    estRec = int(request.POST['rec'])
    
    if estRec>0:
        rec = Recruteur(
            nom = nom,
            prenom = prenom,
            #password = password,
            password = make_password(password),
            mail = mail
        )
        rec.save()
    else:        
        c = Candidat(
            nom = nom,
            prenom = prenom,
            password = make_password(password),
            mail = mail
        )
        c.save()
    print(nom)
    print(prenom)
    print(password)
    print(estRec)
    data = {"reponse": "oui"}
    return JsonResponse(data)


def log_in(request):
    mdp = request.POST['mdp']
    mail = request.POST['email']
    print(mail)
    print(mdp)
    liste = list(Candidat.objects.filter(mail=mail))
    print(len(liste))
    if len(liste)>0 and check_password(mdp, liste[0].password):
        request.session['id_user'] = liste[0].id
        request.session['estRec'] = False
        data = {"reponse":"oui","estRec":False}
    else:
        liste = list(Recruteur.objects.filter(mail=mail))
        if len(liste)>0 and check_password(mdp, liste[0].password):
            request.session['id_user'] = liste[0].id
            request.session['estRec'] = True
            data = {"reponse":"oui","estRec":True}
        else:
            data = {"reponse":"non"}
    return JsonResponse(data)
