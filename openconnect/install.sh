#!/bin/bash

sudo cp openconnect.sh /usr/local/bin/openconnect-launch
sudo cp openconnect.service /etc/systemd/system/openconnect.service
sudo cp vpnc-script /etc/vpnc/vpnc-script
sudo systemctl daemon-reload