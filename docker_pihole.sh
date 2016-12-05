#!/bin/bash

GOOGLE_DNS1=8.8.8.8
GOOGLE_DNS2=8.8.4.4
OPENDNS1=208.67.222.222
OPENDNS2=208.67.220.220

DNS1=$OPENDNS1
DNS2=$OPENDNS2
VIRTUAL_HOST=pihole.local

IMAGE=${1:-'diginc/pi-hole:arm'}
NIC=${2:-'eth0'}
IP=$(ip addr show "$NIC" | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

# default ports + daemonized docker container
docker run \
  -p 53:53/tcp \
  -p 53:53/udp \
  -p 80 \
  --cap-add=NET_ADMIN \
  -e ServerIP="$IP" \
  -e DNS1="$DNS1" \
  -e DNS2="$DNS2" \
  -e VIRTUAL_HOST="$VIRTUAL_HOST" \
  --name pihole \
  --restart always \
  -d "$IMAGE" \
#  -v /var/log/pihole.log:/var/log/pihole.log
