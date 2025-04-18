from .models import Produto, Venda, Categorias, Cliente, Vendedor
from django import forms
from django.contrib.auth.forms import AuthenticationForm
from django.utils import timezone
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

class VendedorForm(forms.ModelForm):
    class Meta:
        model = Vendedor
        fields = ['nome', 'email', 'senha', 'confSenha']
        widgets = {
            'nome': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nome de Usuário'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Email'}),
            'senha': forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Senha'}),
            'confSenha': forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Confirmar Senha'}),
        }

    def clean(self):
        cleaned_data = super().clean()
        senha = cleaned_data.get("senha")
        confSenha = cleaned_data.get("confSenha")

        if senha and confSenha and senha != confSenha:
            raise ValidationError("As senhas não coincidem.")

        return cleaned_data

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ['nome', 'email', 'telefone', 'cpf']
        widgets = {
            'nome': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'telefone': forms.TextInput(attrs={'class': 'form-control', 'id':'id_Telefone', 'data-mask': '(00) 00000-0000',}),
            'cpf': forms.TextInput(attrs={'class': 'form-control', 'id':'id_cpf', 'data-mask': '000.000.000-00',}),
        }
        

class CategoriasForm(forms.ModelForm):
    class Meta:
        model = Categorias
        fields = ['nome', 'descricao']
        widgets = {
                    'nome': forms.TextInput(attrs={'class': 'form-control'}),
                    'descricao': forms.TextInput(attrs={'class': 'form-control'}),
                }
    
    


class LoginForm(forms.Form):
    email = forms.EmailField(label='Email', widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'placeholder': 'Digite seu email'
    }))
    senha = forms.CharField(label='Senha', widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'placeholder': 'Digite sua senha'
    }))
class CustomAuthenticationForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nome'].label = 'Nome de Usuário'
        self.fields['nome'].widget.attrs.update({'class': 'form-control', 'placeholder': 'Nome de Usuário'})
        self.fields['senha'].label = 'Senha'
        self.fields['senha'].widget.attrs.update({'class': 'form-control', 'placeholder': 'Senha'})

class ProdutoForm(forms.ModelForm):
    class Meta:
        model = Produto
        fields = ['nome', 'descricao', 'preco', 'quantidade_estoque', 'categorias']
        widgets = {
            'nome': forms.TextInput(attrs={'class': 'form-control'}),
            'descricao': forms.TextInput(attrs={'class': 'form-control'}),
            'preco': forms.NumberInput(attrs={'class': 'form-control'}),
            'quantidade_estoque': forms.NumberInput(attrs={'class': 'form-control'}),
            'categorias': forms.Select(attrs={'class': 'form-control'}),
        }

class VendaForm(forms.ModelForm):
    
    class Meta:
        model = Venda
        fields = ['cliente', 'status']  
        widgets = {
            'cliente': forms.Select(attrs={'class': 'form-control'}),
            'status': forms.Select(attrs={'class': 'form-control'}),
        }
    
    def save(self, commit=True):
        venda = super().save(commit=False)
        venda.data_venda = timezone.now() 
        if commit:
            venda.save()
        return venda
    