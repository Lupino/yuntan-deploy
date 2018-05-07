#!/usr/bin/env bash

VER=yuntan-build

docker build -t yuntan-build . || exit 1

docker rm yuntan-builded

docker run --name yuntan-builded yuntan-build ls > /dev/null

docker cp yuntan-builded:/data/bin/periodicd images/periodicd
docker cp yuntan-builded:/data/bin/periodic images/periodicd
docker cp yuntan-builded:/data/bin/periodic-run images/periodicd

docker build -t periodicd:$VER images/periodicd

docker cp yuntan-builded:/data/bin/simple-gateway images/simple-gateway
docker build -t simple-gateway:$VER images/simple-gateway

docker cp yuntan-builded:/data/bin/coin images/coin
docker build -t coin:$VER images/coin

docker cp yuntan-builded:/data/bin/func images/func
docker build -t func:$VER images/func

docker cp yuntan-builded:/data/bin/yuntan-article images/yuntan-article
docker build -t yuntan-article:$VER images/yuntan-article

docker cp yuntan-builded:/data/bin/yuntan-cart images/yuntan-cart
docker build -t yuntan-cart:$VER images/yuntan-cart

docker cp yuntan-builded:/data/bin/yuntan-mqtt images/yuntan-mqtt
docker build -t yuntan-mqtt:$VER images/yuntan-mqtt

docker cp yuntan-builded:/data/bin/yuntan-share images/yuntan-share
docker build -t yuntan-share:$VER images/yuntan-share

docker cp yuntan-builded:/data/bin/yuntan-user images/yuntan-user
docker build -t yuntan-user:$VER images/yuntan-user
