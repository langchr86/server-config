#!/usr/bin/env bash

# update system
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# basic tools
sudo apt-get install -y \
  tmux tree nano wget iotop htop rsync \
  htop iotop sysstat dstat smartmontools

# setup timezone
sudo timedatectl set-timezone Europe/Zurich
