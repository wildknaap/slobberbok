#!/bin/bash

/usr/bin/screen /usr/bin/sudo /usr/sbin/openvpn --config /home/<user>/.vpn/client.ovpn --auth-retry interact

#EOF
