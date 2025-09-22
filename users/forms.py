from django import forms
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.models import User


class RegistrationForm(forms.ModelForm):

    username = forms.CharField(label='Username', widget=forms.TextInput(attrs={'placeholder': '输入用户名'}))

    password = forms.CharField(label='密码',
                               widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': '输入密码'}))
    confirm_password = forms.CharField(label='确认密码', widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'placeholder': '确认密码'}))

    email = forms.EmailField(
        label='邮箱',
        required=True,
        widget=forms.EmailInput(attrs={'class': 'form-control', 'placeholder': '请输入邮箱'})
    )

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name', 'password']

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("password")
        confirm_password = cleaned_data.get("confirm_password")

        if password and password != confirm_password:
            self.add_error('confirm_password', "密码不匹配，请重新输入。")
            raise forms.ValidationError("密码不匹配，请重新输入。")
        return cleaned_data


class CustomUserChangeForm(UserChangeForm):
    password = None  # 隐藏密码

    class Meta:
        model = User
        fields = ('username', 'email', 'first_name','last_name')
