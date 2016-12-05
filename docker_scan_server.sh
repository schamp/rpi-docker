#!/bin/bash
docker run \
  --privileged \
  -e "VIRTUAL_HOST=scanner.local" \
  -p 80 \
  -v /var/run/dbus:/var/run/dbus \
  -v /dev/bus/usb/:/dev/bus/usb \
  -v /home/pi/scans:/var/www/html/scans \
  --name scan-server \
  --restart always \
  -t \
  schamp/rpi-scan-server

# add to be able to use bash with cmd: `docker exec -i -t scan-server /bin/bash`
#  -t \
