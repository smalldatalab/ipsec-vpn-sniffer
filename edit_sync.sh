#!/bin/bash

MOD_ROOT=$( dirname $1 )
mkdir -p ${MOD_ROOT#"/"}
MOD_FILE=${MOD_ROOT#"/"}/$( basename $1 )

echo "saving to $MOD_FILE"

docker cp ipsec-vpn-server:$1 $MOD_FILE

rmate $MOD_FILE
while inotifywait -e close_write $MOD_FILE; do
  echo "changed at $( date )"
  docker cp $MOD_FILE ipsec-vpn-server:$1
  echo "sync complete!"
done
