#!/usr/bin/env bash

#ensure proper shutdown and removal of fib containers
./stop.sh

#start the fibservice in background
docker run -d --name fibservice fibservice

#start the fibconsumer in background, link the fibservice, and bind the docker container port(5000) to the host(vagrant) port(80) 
docker run -d -p 0.0.0.0:80:5000 --link fibservice:fib --name fibconsumer fibconsumer
