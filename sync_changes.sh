#!/bin/bash

docker cp ipsec-vpn-server_image/staging/etc/ipsec.conf ipsec-vpn-server:/etc/ipsec.conf
docker exec -it ipsec-vpn-server service ipsec restart

for fp in ipsec-vpn-server_image/staging/etc/ppp/*.local; do
  docker cp $fp ipsec-vpn-server:/etc/ppp/$( basename $fp )
done
