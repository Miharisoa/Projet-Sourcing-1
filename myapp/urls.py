from django.conf.urls import url
from . import views

app_name = 'myapp'

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^home/',views.home,name='homepage'),
    url(r'^newuser/',views.create_new_account,name="signup"),
    url(r'^login/',views.log_in,name="signin"),
]