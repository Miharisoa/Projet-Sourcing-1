from django.conf.urls import url
# from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from . import views

app_name = 'dashboard'

urlpatterns = [
    # path('recruteur/',views.get_dashboard_recruteur,name='recruteur'),
    # path('candidat/',views.get_dashboard_candidat,name='candidat'),
    # path('candidat/<int:id_categorie>/',views.get_cv_in_categorie,name='details'),
    
    url('recruteur/',views.get_dashboard_recruteur,name='recruteur'),
    url('candidat/',views.get_dashboard_candidat,name='candidat'),
    url('candidat/<int:id_categorie>/',views.get_cv_in_categorie,name='details'),
    url('email/',views.change_email,name='change_email'),
    url('adress/',views.change_adress,name='change_adress'),
    url('change_profil/',views.change_profil,name='change_profil'),
    url('upload/',views.uploadFile,name='upload'),
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
