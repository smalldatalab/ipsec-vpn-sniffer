#!/bin/bash

docker cp etc/ipsec.conf ipsec-vpn-server:/etc/ipsec.conf
docker exec -it ipsec-vpn-server service ipsec restart

for fp in ipsec-vpn-server_rebased/staging/etc/ppp/*.local; do
  docker cp $fp ipsec-vpn-server:/etc/ppp/$( basename $fp )
done
