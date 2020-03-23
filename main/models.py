from django.db import models

# Create your models here.


# Клиенты
class Client(models.Model):
    email = models.CharField(primary_key=True, max_length=200)
    password = models.CharField(max_length=100)
    token = models.CharField(max_length=100) # токен для авторизации при выполнении методов API


# Счета клиентов (связь с клиентами 1:М в дальнейшем позволит делать несколько счетов для клиента)
class Account(models.Model):
    id = models.AutoField(primary_key=True)
    client = models.ForeignKey(
        Client,
        on_delete=models.DO_NOTHING,
        to_field='email')
    currency = models.ForeignKey( # валюта счета
        'Currency',
        on_delete=models.DO_NOTHING,
        to_field='code')
    amount = models.FloatField() # баланс (остаток) на счете


# Операции над счетами
class Operation(models.Model):
    id = models.AutoField(primary_key=True)
    dt = models.DateTimeField() # дата операции
    account_source = models.ForeignKey( # счет, с которого был совершен перевод
        Account,
        on_delete=models.DO_NOTHING,
        to_field='id',
        related_name='ops_source')
    account_dest = models.ForeignKey( # счет, на который был совершен перевод
        Account,
        on_delete=models.DO_NOTHING,
        to_field='id',
        related_name='ops_dest')
    amount_source = models.FloatField() # сумма списанная (в валюте счета account_source)
    amount_dest = models.FloatField() # сумма зачисленная (в валюте счета account_dest)


# Валюты
# EUR, USD, GPB, RUB, BTC
class Currency(models.Model):
    code = models.CharField(primary_key=True, max_length=10) # код валюты (EUR, USD и т.д)
    rate = models.FloatField() # курс валюты по отношению к EUR (EUR принята как базовая)
