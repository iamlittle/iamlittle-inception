#!/usr/bin/env bash

echo
echo "============= MEMBER JOIN ============="
echo "New event: ${SERF_EVENT}. Data follows..."
while read line; do
    printf "${line}\n"
done