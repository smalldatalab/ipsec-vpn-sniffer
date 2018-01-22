#!/bin/bash

docker cp etc/ipsec.conf ipsec-vpn-server:/etc/ipsec.conf
docker exec -it ipsec-vpn-server service ipsec restart

for fp in etc/ppp_scripts/*.local; do
  docker cp $fp ipsec-vpn-server:/etc/ppp/$( basename $fp )
done
