from django import forms

from .models import Candidat

class CandidatForm(forms.ModelForm):

    class Meta:
        model = Candidat
        widgets = {
            'nom': forms.TextInput(attrs={'class': 'form-control'}),
            'prenom': forms.TextInput(attrs={'class': 'form-control'}),
            'ddn': forms.DateInput(attrs={'class': 'form-control'}),
            'sexe': forms.Select(attrs={'id': 'datetimepicker1','class': 'form-control'}),
            # 'mail': forms.EmailInput(attrs={'id': 'datetimepicker2','class': 'form-control'}),
            'password': forms.PasswordInput(attrs={'class': 'form-control'}),
            # 'adresse': forms.TextInput(attrs={'class': 'form-control'}),
        }
        
        fields = ('nom', 'prenom','ddn','sexe','password')