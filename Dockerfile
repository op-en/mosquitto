FROM ubuntu:latest

MAINTAINER Anton Gustafsson <anton.gustafsson@tii.se>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y
RUN mkdir -p /usr/local/src
RUN mkdir -p /etc/mosquitto
WORKDIR /usr/local/src
RUN wget http://mosquitto.org/files/source/mosquitto-1.4.8.tar.gz
RUN tar xvzf ./mosquitto-1.4.8.tar.gz
WORKDIR /usr/local/src/mosquitto-1.4.8
RUN make
RUN make install
RUN adduser --system --disabled-password --disabled-login mosquitto
RUN cp /usr/local/src/mosquitto-1.4.8/mosquitto.conf /etc/mosquitto
VOLUME /etc/mosquitto
EXPOSE 1883
CMD ["/usr/local/sbin/mosquitto","-c","/etc/mosquitto/mosquitto.conf"]
