#!/bin/bash
docker run -d \
  -p 631:631 \
  -p 137:137 \
  -p 138:138 \
  -p 139:139 \
  -p 445:445 \
  --privileged \
  -e "VIRTUAL_HOST=magicolor.local" \
  -e "VIRTUAL_PORT=631" \
  -v /var/run/dbus:/var/run/dbus \
  -v /dev/bus/usb/:/dev/bus/usb \
  --name cups-samba \
  --restart always \
  cups-samba

