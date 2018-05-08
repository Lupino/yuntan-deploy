FROM ubuntu:16.04
MAINTAINER Li Meng Jun "lmjubuntu@gmail.com"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libmysqlclient20 libncurses5 libgmp10 netbase

WORKDIR /data

COPY entrypoint.sh /usr/bin
COPY yuntan-share /usr/bin
COPY mysql.yaml /data/config.yaml

ENTRYPOINT ["entrypoint.sh"]

CMD ["yuntan-share"]
