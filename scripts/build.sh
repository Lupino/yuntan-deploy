#!/usr/bin/env bash

VER=yuntan-build

docker build -t yuntan-build . || exit 1

docker rm yuntan-builded

docker run --name yuntan-builded yuntan-build ls > /dev/null

docker cp /data/bin/periodicd images/periodicd
docker cp /data/bin/periodic images/periodicd
docker cp /data/bin/periodic-run images/periodicd

docker build -t periodicd:$VER images/periodicd
