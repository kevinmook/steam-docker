FROM phusion/baseimage:0.11
MAINTAINER Kevin Mook <kevin@kevinmook.com>

RUN apt-get update && \
    apt-get install -y wget software-properties-common vim git

RUN add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32gcc1 steamcmd

VOLUME ["/data"]

CMD ["/sbin/my_init"]
