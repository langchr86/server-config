#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

SD_PATH="/etc/systemd/system"

cp -f ddclient.service ${SD_PATH}
cp -f ddclient.timer ${SD_PATH}

systemctl daemon-reload


cp -f ddclient /usr/sbin/
mkdir -p /etc/ddclient/
cp -f ddclient.conf /etc/ddclient/
chmod 600 /etc/ddclient/ddclient.conf
mkdir -p /var/cache/ddclient/


systemctl enable ddclient.timer
systemctl start ddclient.timer