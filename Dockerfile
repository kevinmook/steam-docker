FROM phusion/baseimage:0.11
MAINTAINER Kevin Mook <kevin@kevinmook.com>

RUN add-apt-repository multiverse && \
  dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get install -y wget software-properties-common vim git net-tools lib32gcc1 lib32stdc++6

RUN mkdir ~/steamcmd && \
  cd ~/steamcmd && \
  wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
  tar -xvzf steamcmd_linux.tar.gz && \
  rm steamcmd_linux.tar.gz

RUN /root/steamcmd/steamcmd.sh +login anonymous +quit

ENV FORCE_INSTALL_DIR /Steam/apps
ENV STEAM_CMD_DIR /root/steamcmd

VOLUME ["/Steam"]
VOLUME ["/configs"]

EXPOSE 27015/tcp 27015/udp 27020/udp

ADD /container_files /container_files

CMD ["/sbin/my_init"]
