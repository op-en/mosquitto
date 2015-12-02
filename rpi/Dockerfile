FROM resin/rpi-raspbian
MAINTAINER Leo Fidjeland (leo.fidjeland@gmail.com)

ENV DEBIAN_FRONTEND noninteractive

# Do it all in one step for a smaller binary
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y && \
    mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    wget http://mosquitto.org/files/source/mosquitto-1.4.tar.gz && \
    tar xvzf ./mosquitto-1.4.tar.gz && \
    cd /usr/local/src/mosquitto-1.4 && \
    make && make install && \
    cd /usr/local/src && \
    rm mosquitto-1.4.tar.gz && \
    apt-get autoremove wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y


# RUN apt-get update
# RUN apt-get upgrade -y
# RUN apt-get install wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y
# RUN mkdir -p /usr/local/src
# WORKDIR /usr/local/src
# RUN wget http://mosquitto.org/files/source/mosquitto-1.4.tar.gz
# RUN tar xvzf ./mosquitto-1.4.tar.gz
# WORKDIR /usr/local/src/mosquitto-1.4
# RUN make
# RUN make install
# WORKDIR /usr/local/src
# RUN rm mosquitto-1.4.tar.gz
# RUN apt-get autoremove wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev -y
RUN adduser --system --disabled-password --disabled-login mosquitto
EXPOSE 1883
CMD ["/usr/local/sbin/mosquitto"]
