import os
import requests
from opalytils.logutils import log

def is_etcd_up():
    nmap_res = os.popen("nmap localhost | grep 4001")
    etcd_up = len(nmap_res.read()) > 0
    log("etcd_up - %s" % etcd_up)
    return etcd_up

def create_etcd_dir(dirname):
    url = "http://127.0.0.1:%s/v2/keys/%s" % (client_port(), dirname);
    log("creating etcd directory : %s" % url)
    r = requests.put(url, data={'dir':'true'})
    log("etcd directory creation result : %s" % r.content)
    return r.content

def set_etcd_key(key, value):
    url = "http://127.0.0.1:%s/v2/keys/%s" % (client_port(), key);
    log("setting etcd key : %s" % url)
    r = requests.put(url, data={'value': value})
    log("etcd key set result : %s" % r.content)
    return r.content

def get_etcd_value(key):
    url = "http://127.0.0.1:%s/v2/keys/%s" % (client_port(), key);
    log("getting etcd key : %s" % url)
    r = requests.get(url)
    log("etcd key get result : %s" % r.content)
    return r.content

def client_port():
    return os.environ['CLIENT_PORT'];

def public_ip():
    return os.environ['PUBLIC_IP']

def etcd_error_str():
    return 'errorCode'