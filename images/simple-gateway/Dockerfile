FROM ubuntu:18.04
MAINTAINER Li Meng Jun "lmjubuntu@gmail.com"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libmysqlclient20 libncurses5 libgmp10 netbase

WORKDIR /data

COPY simple-gateway /usr/bin
COPY simple-gateway.yaml /data/config.yaml

ENTRYPOINT ["simple-gateway"]

CMD ["-c", "/data/config.yaml"]
