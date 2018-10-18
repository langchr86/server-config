#!/bin/bash

sudo apt-get update

sudo apt-get install -y \
  xorg xauth xbase-clients x11-common
  git-core git-gui gitk \
  tmux tree rsync \
  htop iotop sysstat dstat smartmontools \
  openssh-client openssh-server

git config --global user.name "Christian Lang"
git config --global user.email "lang.chr86@gmail.com"

cp .bash_aliases ~
cp .tmux.conf ~
cp tmux-helper.bash ~
cp git-helper.bash ~

sudo cp ./btrfs-snap/btrfs-snap /usr/bin
