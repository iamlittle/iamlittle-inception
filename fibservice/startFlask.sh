#!/usr/bin/env bash

serf join $FIBAMBASSADOR_1_PORT_7946_TCP_ADDR:$FIBAMBASSADOR_1_PORT_7946_TCP_PORT

python /usr/local/src/fibservice/fibservice.py