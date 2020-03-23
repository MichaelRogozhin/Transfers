# Transfers
Transfers of peoples - test exercise

Используется:
Python 3.7.6
Django 2.2.11
PostgreSQL 11.6


Создание виртуального окружения
python -m venv env

Активация виртуального окружения
env\scripts\activate.bat

Установка пакетов
pip install -r requirements.txt


В Postgres необходимо создать пользователя transfersuser с паролем 123456, и базу данных transfersdb с владельцем transfersuser.
Данные для подключения к БД в прокте находятся в файле Transfers/options.py

Затем провести миграции или восстановить бекап базы данных из файла _db/transfersdb.backup или _db/transfersdb.sql