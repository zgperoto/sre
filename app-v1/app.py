from flask import Flask, render_template, jsonify, request
from prometheus_flask_exporter import PrometheusMetrics
import time
import random

app = Flask(__name__)
metrics = PrometheusMetrics(app, group_by='endpoint')  # exposes /metrics by default


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/status')

def status():
    #delay = random.uniform(0.5, 1.0)  # delay between 100ms and 1000ms
    #time.sleep(delay)
    #return jsonify({"message": "Tudo certo!", "delay_ms": int(delay * 1000)}), 200
    return jsonify({"message": "Tudo certo!"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)