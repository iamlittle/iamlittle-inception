#!/usr/bin/env bash

#sleep to allow the master node to get setup
sleep 3

# create the services dir if necessary
# curl -L http://127.0.0.1:${CLIENT_PORT}/v2/keys/services -XPUT -d dir=true

# add this instance as webservice
# curl -L http://127.0.0.1:${CLIENT_PORT}/v2/keys/services/webservice -XPUT -d value=${PUBLIC_IP}:${CLIENT_PORT}

python /usr/local/src/webservice/webservice.py