#!/usr/bin/env bash

#sleep to allow the master node to get setup
sleep 3

etcd -peer-addr ${PUBLIC_IP}:${SERVER_PORT} -addr ${PUBLIC_IP}:${CLIENT_PORT} -name webapp -peers ${MASTER_IP}:${SERVER_PORT}

python /usr/local/src/webapp/webapp.py