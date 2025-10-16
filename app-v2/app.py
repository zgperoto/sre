from flask import Flask, render_template, jsonify, request
from prometheus_flask_exporter import PrometheusMetrics
from prometheus_client import Counter
import time
import random

app = Flask(__name__)
metrics = PrometheusMetrics(app)  # exposes /metrics by default
ip_counter = Counter('client_ip_requests', 'Requests by client IP', ['ip'])

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/status')
def status():
    ip = request.remote_addr
    ip_counter.labels(ip=ip).inc()
    return jsonify({"message": "Error, Service Unaviable"}), 503

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)