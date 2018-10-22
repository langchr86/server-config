#!/usr/bin/env bash

sudo apt-get install -y \
  xorg xauth \
  openssh-client openssh-server

cat authorized_keys >> ~/.ssh/authorized_keys
