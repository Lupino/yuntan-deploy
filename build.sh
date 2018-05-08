#!/usr/bin/env bash

VER=yuntan-build

docker build -t yuntan-build compile || exit 1

docker rm yuntan-builded

docker run --name yuntan-builded yuntan-build ls > /dev/null

docker cp yuntan-builded:/data/bin/periodicd images/periodicd
docker cp yuntan-builded:/data/bin/periodic images/periodicd
docker cp yuntan-builded:/data/bin/periodic-run images/periodicd
docker build -t periodicd:$VER images/periodicd

cp conf.d/simple-gateway.yaml images/simple-gateway
docker cp yuntan-builded:/data/bin/simple-gateway images/simple-gateway
docker build -t simple-gateway:$VER images/simple-gateway

docker cp yuntan-builded:/data/bin/func images/func
docker build -t func:$VER images/func

docker cp yuntan-builded:/data/bin/yuntan-mqtt images/yuntan-mqtt
docker build -t yuntan-mqtt:$VER images/yuntan-mqtt

build_service() {
    cp conf.d/mysql.yaml images/$1
    cp conf.d/entrypoint.sh images/$1
    sed -i "s/SERVICE/$1/g" images/$1/entrypoint.sh
    docker cp yuntan-builded:/data/bin/$1 images/$1
    docker build -t $1:$VER images/$1
}

SERVICES=(
    coin
    yuntan-article
    yuntan-cart
    yuntan-user
    yuntan-share
)

for service in ${SERVICES[@]};do
    build_service $service
done
