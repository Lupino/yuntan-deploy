FROM ubuntu:18.04
MAINTAINER Li Meng Jun "lmjubuntu@gmail.com"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libmysqlclient20 libncurses5 libgmp10 netbase

WORKDIR /data

COPY settings.yml /data/settings.yml
COPY yuntan-mqtt /usr/bin
COPY mqtt-entrypoint.sh /usr/bin

EXPOSE 1883

ENTRYPOINT ["mqtt-entrypoint.sh"]
