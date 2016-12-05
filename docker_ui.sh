#!/bin/bash
docker run \
  -d \
  -p 9000 \
  --name dockerui \
  --restart always \
  -e "VIRTUAL_HOST=dockerui.local" \
  -e "VIRTUAL_PORT=9000" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  hypriot/rpi-dockerui
