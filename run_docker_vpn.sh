#!/bin/bash

sudo modprobe af_key

docker run \
    --name ipsec-vpn-server \
    --env-file ./vpn.env \
    -p 500:500/udp \
    -p 4500:4500/udp \
    --add-host=pgdb:172.31.28.163 \
    -v /lib/modules:/lib/modules:ro \
    -v $( pwd )/logger-scripts:/root/scripts \
    -d --privileged \
    faisal/ipsec-vpn-sniffer
    # hwdsl2/ipsec-vpn-server
