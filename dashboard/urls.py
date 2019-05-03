from django.conf.urls import url
from django.urls import path
from . import views

app_name = 'dashboard'

urlpatterns = [
    path('recruteur/',views.get_dashboard_recruteur,name='recruteur'),
    path('candidat/',views.get_dashboard_candidat,name='candidat'),
    path('candidat/<int:id_categorie>/',views.get_cv_in_categorie,name='details'),
]