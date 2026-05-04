# Базовый образ
FROM ubuntu:22.04

# Информация об авторе
MAINTAINER Igor Gurin

# Переменные окружения
ENV DB_NAME=mydb123
ENV DB_USER=user123
ENV DB_PASS=pass123

# Рабочая директория
WORKDIR /app

# Копируем файлы
COPY index.html /var/www/html/index.html

# Добавляем файл
ADD test.txt /app/test.txt

# Устанавливаем пакеты
RUN apt-get update && \
    apt-get install -y nginx mysql-server && \
    apt-get clean

# Указываем порты
EXPOSE 80
EXPOSE 3306

# Создаём volume для базы
VOLUME ["/var/lib/mysql"]

# Создаём пользователя
RUN useradd -m appuser

# Меняем пользователя
USER appuser

# Команда запуска в запущенном контейнере
CMD ["nginx", "-g", "daemon off;"]