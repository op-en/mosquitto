FROM resin/rpi-raspbian
MAINTAINER Leo Fidjeland (leo.fidjeland@gmail.com)

ENV DEBIAN_FRONTEND noninteractive

# Do it all in one step for a smaller binary
ENV MOSQUITTO_VERSION 1.4.5
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y && \
    mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    wget http://mosquitto.org/files/source/mosquitto-${MOSQUITTO_VERSION}.tar.gz && \
    tar xvzf ./mosquitto-${MOSQUITTO_VERSION}.tar.gz && \
    cd /usr/local/src/mosquitto-${MOSQUITTO_VERSION} && \
    make && make install && \
    cd /usr/local/src && \
    rm mosquitto-${MOSQUITTO_VERSION}.tar.gz && \
    apt-get autoremove wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y


# RUN apt-get update
# RUN apt-get upgrade -y
# RUN apt-get install wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y
# RUN mkdir -p /usr/local/src
# WORKDIR /usr/local/src
# RUN wget http://mosquitto.org/files/source/mosquitto-${MOSQUITTO_VERSION}.tar.gz
# RUN tar xvzf ./mosquitto-${MOSQUITTO_VERSION}.tar.gz
# WORKDIR /usr/local/src/mosquitto-${MOSQUITTO_VERSION}
# RUN make
# RUN make install
# WORKDIR /usr/local/src
# RUN rm mosquitto-${MOSQUITTO_VERSION}.tar.gz
# RUN apt-get autoremove wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y
RUN adduser --system --disabled-password --disabled-login mosquitto
EXPOSE 1883
CMD ["/usr/local/sbin/mosquitto"]
