#!/bin/bash
#
# Deploy wireguard containers
#
##########################################

port_list="42 53 80 123 220 264 443 1194 9201 51820"
peer_list=1,2

for port in $port_list; do
  docker run -d \
    --name="wireguard_port_${port}" \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_MODULE \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Europe/London \
    -e "SERVERPORT=${port}" \
    -e "PEERS=${peer_list}" \
    -e PEERDNS=1.1.1.1,8.8.8.8 \
    -p "${port}:${port}/udp" \
    -v "$(pwd)/config${port}:/config" \
    -v /lib/modules:/lib/modules \
    -v /usr/src:/usr/src \
    --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
    --restart unless-stopped \
    lscr.io/linuxserver/wireguard:latest
done
