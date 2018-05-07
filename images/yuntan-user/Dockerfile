FROM ubuntu:16.04
MAINTAINER Li Meng Jun "lmjubuntu@gmail.com"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libmysqlclient20 libncurses5 libgmp10 netbase

WORKDIR /data

COPY yuntan-user /usr/bin

ENTRYPOINT ["yuntan-user"]

CMD ["-c", "config.yaml", "-H", "0.0.0.0"]
