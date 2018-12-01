#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

sudo apt-get install -y \
  xorg xauth \
  openssh-client openssh-server

cat authorized_keys >> ~/.ssh/authorized_keys
