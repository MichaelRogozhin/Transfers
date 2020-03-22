from django.db import models

# Create your models here.


# �������
class Client(models.Model):
    email = models.CharField(primary_key=True, max_length=200)
    password = models.CharField(max_length=100)
    token = models.CharField(max_length=100) # ����� ��� ����������� ��� ���������� ������� API


# ����� �������� (����� � ��������� 1:� � ���������� �������� ������ ��������� ������ ��� �������)
class Account(models.Model):
    id = models.AutoField(primary_key=True)
    client = models.ForeignKey(
        Client,
        on_delete=models.DO_NOTHING,
        to_field='email')
    currency = models.ForeignKey( # ������ �����
        'Currency',
        on_delete=models.DO_NOTHING,
        to_field='code')
    amount = models.FloatField() # ������ (�������) �� �����


# �������� ��� �������
class Operation(models.Model):
    id = models.AutoField(primary_key=True)
    dt = models.DateTimeField() # ���� ��������
    account_source = models.ForeignKey( # ����, � �������� ��� �������� �������
        Account,
        on_delete=models.DO_NOTHING,
        to_field='id',
        related_name='ops_source')
    account_dest = models.ForeignKey( # ����, �� ������� ��� �������� �������
        Account,
        on_delete=models.DO_NOTHING,
        to_field='id',
        related_name='ops_dest')
    amount_source = models.FloatField() # ����� ��������� (� ������ ����� account_source)
    amount_dest = models.FloatField() # ����� ����������� (� ������ ����� account_dest)


# ������
# EUR, USD, GPB, RUB, BTC
class Currency(models.Model):
    code = models.CharField(primary_key=True, max_length=10) # ��� ������ (EUR, USD � �.�)
    rate = models.FloatField() # ���� ������ �� ��������� � EUR (EUR ������� ��� �������)
