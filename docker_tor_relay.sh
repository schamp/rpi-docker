docker run \
  -d \
  -p :9001:9001 \
  --restart=always \
  --name=tor-relay \
  -e 'NICKNAME=CloudCityTorRelay' \
  -e 'CONTACTINFO=A. Schamp <schamp@gmail.com>' \
  -v '/home/pi/tor:/home/tor/.tor' \
  -t \
  schamp/rpi-tor-relay
