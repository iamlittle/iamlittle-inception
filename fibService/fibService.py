from flask import Flask
from flask import jsonify

from opalytics_www_utils.authentication import requires_auth

app = Flask(__name__)

@app.route("/fib", methods = ['GET'])
#@requires_auth
def fib():
    resp = jsonify({"value" : "%s" % __dumbFib()})
    return resp

def __dumbFib():    
    fib = [1,1]
    for i in xrange(1,10):
        fib.append(fib[i-1] + fib[i])
    return fib

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True, port=5001)