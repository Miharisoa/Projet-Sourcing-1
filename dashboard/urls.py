from django.conf.urls import url
# from django.urls import path
from . import views

app_name = 'dashboard'

urlpatterns = [
    url('recruteur/',views.get_dashboard_recruteur,name='recruteur'),
    url('candidat/',views.get_dashboard_candidat,name='candidat'),
    url('candidat/<int:id_categorie>/',views.get_cv_in_categorie,name='details'),
]