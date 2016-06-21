# Open Energy Mosquitto

This is part of the [Open Energy Project](http://op-en.se/), a research project aiming to make it easier and faster to prototype smart energy services.

## Description

This is a docker build of [mosquitto](http://mosquitto.org/), an MQTT broker.

Currently it is only for raspberry pi! For intel/amd, you might as well use [jllopis/mosquitto](https://hub.docker.com/r/jllopis/mosquitto/).

## Get it
```
docker pull openenergy/rpi-mosquitto
```

## Run it
```
docker run -p 1883:1883 --name mosquitto -d openenergy/rpi-mosquitto
```
