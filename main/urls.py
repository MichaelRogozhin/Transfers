from django.urls import path
from . import views


urlpatterns = [
    path('register', views.Register.as_view()),
    path('authenticate', views.Authenticate.as_view()),
    path('transfer', views.Transfer.as_view()),
    path('get_operations', views.GetOperations.as_view()),
]
