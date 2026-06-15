from flask import Flask
import json

app = Flask(__name__)

@app.route('/get', methods=['GET'])
def get_handler():
    return json.dumps({"method": "GET", "status": "ok"})

@app.route('/post', methods=['POST'])
def post_handler():
    return json.dumps({"method": "POST", "status": "ok"})

@app.route('/put', methods=['PUT'])
def put_handler():
    return json.dumps({"method": "PUT", "status": "ok"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
