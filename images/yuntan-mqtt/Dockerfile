FROM ubuntu:16.04
MAINTAINER Li Meng Jun "lmjubuntu@gmail.com"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libmysqlclient20 libncurses5 libgmp10 netbase

WORKDIR /data

COPY yuntan-mqtt /usr/bin

ENTRYPOINT ["yuntan-mqtt"]

CMD ["broker", "--config", "settings.yml"]
