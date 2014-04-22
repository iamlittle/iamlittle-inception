#!/usr/bin/env bash

#run etcd
etcd -peer-addr ${PUBLIC_IP}:${SERVER_PORT} -addr ${PUBLIC_IP}:${CLIENT_PORT} -name servicelocator

