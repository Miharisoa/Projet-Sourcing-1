from django import forms

from .models import Offre

class OffreForm(forms.ModelForm):

    class Meta:
        model = Offre
        widgets = {
            'intutile': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control'}),
            'mission': forms.Textarea(attrs={'class': 'form-control'}),
            'date_limite': forms.DateInput(attrs={'id': 'datetimepicker1','class': 'form-control'}),
            # 'date_publication': forms.DateInput(attrs={'id': 'datetimepicker2','class': 'form-control'}),
            'mot_cle': forms.SelectMultiple(attrs={'class': 'form-control'}),
        }
        
        fields = ('intutile', 'description','mission','date_limite','mot_cle')