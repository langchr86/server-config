#!/bin/bash

cp -f ddclient /usr/sbin/
mkdir -p /etc/ddclient/
cp -f ddclient.conf /etc/ddclient/
chmod 600 /etc/ddclient/ddclient.conf
