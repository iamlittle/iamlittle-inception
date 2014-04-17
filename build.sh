#!/usr/bin/env bash

#stop and remove any running docker containers
./stop.sh

#remove any existing fib* images
docker rmi fibservice
docker rmi fibconsumer

#build the new images
docker build -t fibconsumer ./fibConsumer/
docker build -t fibservice ./fibService/
