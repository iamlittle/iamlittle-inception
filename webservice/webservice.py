from flask import Flask
from flask import jsonify

import opalytils.etcdutils as eu
import opalytils.strconstants as sc 

app = Flask(__name__)
__initialized = False

@app.route("/fib", methods = ['GET'])
def fib():
    resp = jsonify({"value" : "%s" % __dumbFib()})
    return resp

def __dumbFib():    
    fib = [1,1]
    for i in xrange(1,10):
        fib.append(fib[i-1] + fib[i])
    return fib

def initialize():
    global __initialized
    if(not __initialized):
        register_ret = register_webservice_service()
        if(sc.code_failure() in register_ret):
            return register_ret
        __initialized = True
    return sc.code_success()

def register_webservice_service():
    if(eu.is_etcd_up()):
        eu.create_etcd_dir("services")
        eu.set_etcd_key("services/webservice", eu.public_ip())
        eu.set_etcd_key("services/webservice_port", "5001")
        return sc.code_success()
    else:
        return "%s: etcd server could not be located" % sc.code_failure()

if __name__ == "__main__":
    while sc.code_failure() in initialize():
        time.sleep(1)
    app.run(host='0.0.0.0', debug=True, port=5001)