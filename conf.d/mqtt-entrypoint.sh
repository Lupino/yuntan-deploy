#!/bin/bash
set -e

[[ $DEBUG == true ]] && set -x

GATEWAY=${GATEWAY:-"http://simple-gateway:13000"}
KEY=${KEY:-""}
SECRET=${SECRET:-""}

sed -i "s#GATEWAY#$GATEWAY#g" /data/settings.yml
sed -i "s/KEY/$KEY/g" /data/settings.yml
sed -i "s/SECRET/$SECRET/g" /data/settings.yml

exec yuntan-mqtt broker --config /data/settings.yml
