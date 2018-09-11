FROM ubuntu:18.04
MAINTAINER Li Meng Jun "lmjubuntu@gmail.com"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libgmp10 netbase

WORKDIR /data

COPY periodicd /usr/bin
COPY periodic /usr/bin
COPY periodic-run /usr/bin

ENV PERIODIC_PORT tcp://:5000

EXPOSE 5000

ENTRYPOINT ["periodicd"]
