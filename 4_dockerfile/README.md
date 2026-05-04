# Dockerfile

## Описание

Был создан Dockerfile для сборки образа, содержащего:

* веб-сервер nginx
* базу данных MySQL

В Dockerfile использованы следующие инструкции:

* FROM — базовый образ
* MAINTAINER — информация об авторе
* RUN — установка nginx и MySQL
* CMD — команда запуска nginx
* WORKDIR — рабочая директория
* ENV — переменные окружения
* ADD и COPY — добавление файлов в образ
* VOLUME — директория для хранения бд
* USER — запуск от имени пользователя
* EXPOSE — указание портов

---

## Сборка образа

```bash
docker build -t gurin_is_image_04-05-2026 .
```

---

## Проверка образа

```bash
docker images
```

---

## Просмотр слоев образа

```bash
docker history gurin_is_image_04-05-2026
```