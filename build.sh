#!/usr/bin/env bash

#get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#stop and remove any running fib containers
$DIR/stop.sh

#remove any existing fib* images
docker rmi fibservice
docker rmi fibconsumer

#build the new images
docker build -t fibconsumer $DIR/fibConsumer/
docker build -t fibservice $DIR/fibService/
