import requests
import ast
import time
import sys
from flask import Flask
from flask import jsonify

import opalytils.etcdutils as eu
import opalytils.logutils as log
import opalytils.strconstants as sc

app = Flask(__name__)
__initialized = False

@app.route("/", methods = ['GET'])
def index():
    webservice_ip = webservice_ip_string()
    if(sc.code_failure() in webservice_ip):
        return webservice_ip

    webservice_port = webservice_port_string()
    if(sc.code_failure() in webservice_port):
        return webservice_port

    r = requests.get("http://%s:%s/fib" % (webservice_ip, webservice_port))
    return "Hello from webapp! fibService says %s" % r.content

def initialize():
    global __initialized
    if(not __initialized):
        register_ret = register_webapp_service()
        if(sc.code_failure() in register_ret):
            return register_ret
        __initialized = True
    return sc.code_success()

def webservice_ip_string():
    # try to obtain webservice url
    webservice_value = eu.get_etcd_value("services/webservice")
    webservice_dict = ast.literal_eval(webservice_value)
    if(webservice_dict.has_key(eu.etcd_error_str())):
        return "%s: webservice can not be found." % sc.code_failure()
    return webservice_dict['node']['value']

def webservice_port_string():
    # try to obtain webservice url
    webservice_value = eu.get_etcd_value("services/webservice_port")
    webservice_dict = ast.literal_eval(webservice_value)
    if(webservice_dict.has_key(eu.etcd_error_str())):
        return "%s: webservice port can not be found." % sc.code_failure()
    return webservice_dict['node']['value']

def register_webapp_service():
    if(eu.is_etcd_up()):
        eu.create_etcd_dir("services")
        eu.set_etcd_key("services/webapp", eu.public_ip())
        return sc.code_success()
    else:
        return "%s: etcd server could not be located" % sc.code_failure()

if __name__ == "__main__":
    while sc.code_failure() in initialize():
        time.sleep(1)
    app.run(host='0.0.0.0', debug=True, port=5000)