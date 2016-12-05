#!/bin/bash
docker run \
  -d \
  -p 80:80 \
  -e DEFAULT_HOST=pihole.local \
  --name nginx-proxy \
  -v /var/run/docker.sock:/tmp/docker.sock:ro \
  -v /home/pi/vhost.d:/etc/nginx/vhost.d \
  --restart always \
  trauma/rpi-nginx-proxy

