#!/usr/bin/env bash

#sleep to allow the etcd to get setup
#sleep 3

# create the services dir if necessary
# curl -L http://127.0.0.1:4001/v2/keys/services -XPUT -d dir=true

#add this instance as webapp
# curl -L http://127.0.0.1:${CLIENT_PORT}/v2/keys/services/webapp -XPUT -d value=${PUBLIC_IP}:${CLIENT_PORT}

