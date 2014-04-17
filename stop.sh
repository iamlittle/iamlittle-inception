#!/usr/bin/env bash

for i in $( docker ps -a | grep 'fib' | awk '{print $1}' ); do
    docker stop $i
    docker rm $i
done
