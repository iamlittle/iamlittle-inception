import urllib2
import os
from flask import Flask
from flask import jsonify

app = Flask(__name__)

@app.route("/", methods = ['GET'])
def index():
    fibport = os.getenv('FIB_PORT', 'http://localhost:5001')
    print fibport
    fibsplit = fibport.split('://')
    print fibsplit
    url = 'http://%s/fib' % fibsplit[1]
    print url
    response = urllib2.urlopen(url)
    html = response.read()
    return "Hello from fibConsumer! fibService says %s" % html

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True, port=5000)