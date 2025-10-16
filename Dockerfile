FROM python:3.10-slim

WORKDIR /app

COPY app-v1/app.py .
COPY templates/ templates/

RUN pip install flask && pip install prometheus_flask_exporter

EXPOSE 5000

CMD ["python", "app.py"]