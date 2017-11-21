FROM ubuntu:16.04
MAINTAINER Li Meng Jun "lmjubuntu@gmail.com"

RUN apt-get update && \
    apt-get install -y git curl libmysqlclient-dev pkg-config libncurses5-dev && \
    curl -sSL https://get.haskellstack.org/ | sh

WORKDIR /data
ADD stack.yaml /data/stack.yaml
RUN stack setup
ADD scripts/build.sh build.sh
RUN build.sh
