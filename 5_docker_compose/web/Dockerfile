FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

WORKDIR /app

COPY app.py .

RUN pip install flask

EXPOSE 80

CMD service nginx start && python app.py