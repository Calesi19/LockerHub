from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods=['POST'])
def receive_message():
    message = request.form['message']
    print('Received message:', message)
    return 'OK'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

