import json
import uuid
import requests
from django.shortcuts import render
from django.http import HttpResponse
from django.utils import timezone
from django.db.models import Q
from rest_framework.views import APIView
from main.models import Client
from main.models import Account
from main.models import Operation
from main.models import Currency

# Create your views here.

#Проект представляет из себя REST API, которое позволяет  выполнять следующие действия:
#●	зарегистрировать пользователя с указанием Register
#○	начальный баланс
#○	валюта счета
#○	email (уникальный; используется для входа)
#○	пароль
#●	аутентифицировать пользователя по почте и паролю Authenticate
#●	перевести средства со своего счета на счет другого пользователя (используйте формулу конвертации, если валюты счетов отличаются) Transfer
#●	просмотреть список всех операций по своему счету GetOperations
#●	обновлять курсы валют со стороннего ресурса (например, exchangeratesapi.io) раз в N времени (например, раз в 3 минуты)

#Система должна поддерживать следующие валюты: EUR, USD, GPB, RUB, BTC


# зарегистрировать пользователя
class Register(APIView):
    def post(self, request, *args, **kwargs):

        #print('request.GET', request.GET, type(request.GET))
        #print('request.data', request.data, type(request.data))
        params = request.data
        # проверка параметров
        error = None
        if 'balance' not in params:
            error = 'Не указан параметр balance'
        if 'currency' not in params:
            error = 'Не указан параметр currency'
        if 'email' not in params:
            error = 'Не указан параметр email'
        if 'password' not in params:
            error = 'Не указан параметр password'
        if error is not None:
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")
        # проверка валюты
        currency = params['currency']
        if not Currency.objects.filter(code=currency).exists():
            error = 'Валюта [%s] в системе отсутствует' % currency
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")

        # проверка наличия такого клиента
        email = params['email']
        if Client.objects.filter(email=email).exists():
            error = 'Клиент с e-mail [%s] уже пристутствует в системе' % email
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")

        # создание клиента
        client = Client()
        client.email = params['email']
        client.password = params['password']
        client.token = uuid.uuid1()
        client.save()

        # создание счета
        account = Account()
        account.client = client
        account.currency_id = params['currency']
        account.amount = params['balance']
        account.save()

        res_json = json.dumps({'result': 'ok'}, ensure_ascii=False)
        return HttpResponse(res_json, content_type="application/json")


# аутентифицировать пользователя по почте и паролю
class Authenticate(APIView):
    def post(self, request, *args, **kwargs):
        params = request.data
        # проверка параметров
        error = None
        if 'email' not in params:
            error = 'Не указан параметр email'
        if 'password' not in params:
            error = 'Не указан параметр password'
        if error is not None:
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")

        email = params['email']
        # проверка наличия пользователя в системе
        if not Client.objects.filter(email=email).exists():
            error = 'Пользователь [%s] в системе отсутствует' % email
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")

        # проверка пароля
        client = Client.objects.get(email=email)
        if client.password == params['password']:
            res_json = json.dumps({'result': 'ok', 'token': client.token}, ensure_ascii=False)
        else:
            error = 'Ошибка авторизации - неверный пароль'
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
        return HttpResponse(res_json, content_type="application/json")


# перевести средства со своего счета на счет другого пользователя
class Transfer(APIView):
    def post(self, request, *args, **kwargs):
        params = request.data
        # проверка параметров
        error = None
        if 'email' not in params:
            error = 'Не указан параметр email'
        if 'token' not in params:
            error = 'Не указан параметр token'
        if 'client_dest' not in params:
            error = 'Не указан параметр client_dest'
        if 'amount' not in params:
            error = 'Не указан параметр amount'
        if error is not None:
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")

        # ПРОВЕРКА АВТОРИЗАЦИИ
        email = params['email']
        token = params['token']
        # проверка наличия пользователя в системе
        if not Client.objects.filter(email=email).exists():
            error = 'Пользователь [%s] в системе отсутствует' % email
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")
        # проверка токена
        client = Client.objects.get(email=email)
        if client.token != token:
            error = 'Ошибка авторизации - неверный токен'
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)

        # ПЕРЕВОД
        client_dest = params['client_dest']
        amount = params['amount']
        # проверка наличия пользователя-получателя
        if not Client.objects.filter(email=client_dest).exists():
            error = 'Пользователь [%s] в системе отсутствует' % client_dest
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")


        account_source = Account.objects.get(client=client)
        account_dest = Account.objects.get(client=client_dest)
        k_source = account_source.currency.rate
        k_dest = account_dest.currency.rate
        amount_source = amount
        amount_dest = round(amount/k_source*k_dest, 2)
        # создание операции
        operation = Operation()
        operation.dt = timezone.now()
        operation.account_source = account_source
        operation.account_dest = account_dest
        operation.amount_source = amount_source
        operation.amount_dest = amount_dest
        operation.save()
        # обновление баланса отправителя
        account_source.amount = account_source.amount - amount_source
        account_source.save()
        # обновление баланса получателя
        account_dest.amount = account_dest.amount + amount_dest
        account_dest.save()

        res_json = json.dumps({'result': 'ok'}, ensure_ascii=False)
        return HttpResponse(res_json, content_type="application/json")


# просмотреть список всех операций по своему счету
class GetOperations(APIView):
    def post(self, request, *args, **kwargs):
        params = request.data
        # проверка параметров
        error = None
        if 'email' not in params:
            error = 'Не указан параметр email'
        if 'token' not in params:
            error = 'Не указан параметр token'
        if error is not None:
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")

        # ПРОВЕРКА АВТОРИЗАЦИИ
        email = params['email']
        token = params['token']
        # проверка наличия пользователя в системе
        if not Client.objects.filter(email=email).exists():
            error = 'Пользователь [%s] в системе отсутствует' % email
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)
            return HttpResponse(res_json, content_type="application/json")
        # проверка токена
        client = Client.objects.get(email=email)
        if client.token != token:
            error = 'Ошибка авторизации - неверный токен'
            res_json = json.dumps({'result': 'error', 'error_text': error}, ensure_ascii=False)



        # ФОРМИРОВАНИЕ СПИСКА
        account = Account.objects.get(client=client)
        operations = Operation.objects.filter(Q(account_source=account) | Q(account_dest=account)).order_by('dt')

        oper_list = []
        for operation in operations:
            oper_dict = {}
            #oper_dict['id'] = operation.id
            #oper_dict['dt'] = operation.dt
            oper_dict['account_source'] = operation.account_source.client.email
            oper_dict['currency_source'] = operation.account_source.currency.code
            oper_dict['amount_source'] = operation.amount_source
            oper_dict['account_dest'] = operation.account_dest.client.email
            oper_dict['currency_dest'] = operation.account_dest.currency.code
            oper_dict['amount_dest'] = operation.amount_dest
            oper_list.append(oper_dict)

        res_json = json.dumps({'result': 'ok', 'operations': oper_list}, ensure_ascii=False)
        return HttpResponse(res_json, content_type="application/json")



def getCurrencyRates():
    data = requests.get('https://api.exchangeratesapi.io/latest')

    js = data.json()
    #res = res.encode('utf-8').decode('cp1251')
    print('js', js, type(js))

    return


getCurrencyRates()