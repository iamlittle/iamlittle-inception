#!/usr/bin/env bash

serf join $AMBASSADOR_1_PORT_7946_TCP_ADDR:$AMBASSADOR_1_PORT_7946_TCP_PORT

python /usr/local/src/webapp/webapp.py