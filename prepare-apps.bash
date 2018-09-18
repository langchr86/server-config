#!/bin/bash

apt-get update

apt-get install -y btrfs-tools
apt-get install -y lvm2
apt-get install -y git-core git-gui gitk
apt-get install -y tmux tree
apt-get install -y openssh-client openssh-server
apt-get install -y samba
apt-get install -y docker.io
apt-get install -y htop iotop
apt-get install -y smartmontools

git config --global user.name "Christian Lang"
git config --global user.email "lang.chr86@gmail.com"

cp .tmux.conf ~
cp tmux-helper.bash ~
cat .bashrc >> ~/.bashrc
cp git-prompt.bash ~

cp ./btrfs-snap/btrfs-snap /usr/bin
