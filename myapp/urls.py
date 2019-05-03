from django.conf.urls import url
from django.urls import path
from . import views

app_name = 'myapp'

urlpatterns = [
    path('',views.index,name='index'),
    path('home/',views.home,name='homepage'),
    path('newuser/',views.create_new_account,name="signup"),
    path('login/',views.log_in,name="signin"),
]