#!/bin/bash

route del -net 0.0.0.0 gw 172.16.42.1 netmask 0.0.0.0 dev eth1

iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
iptables -A FORWARD -i eth1 -j ACCEPT

# EOF
