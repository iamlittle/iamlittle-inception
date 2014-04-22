#!/usr/bin/env bash

sleep 3

serf join 192.168.76.101:7946

python /usr/local/src/webservice/webservice.py