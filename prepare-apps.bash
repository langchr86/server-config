#!/bin/bash

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
  smartmontools rsync \
  git-core git-gui gitk \
  tmux tree htop iotop sysstat dstat \
  openssh-client openssh-server

git config --global user.name "Christian Lang"
git config --global user.email "lang.chr86@gmail.com"

cp .bash_aliases ~
cp .tmux.conf ~
cp tmux-helper.bash ~
cp git-helper.bash ~

sudo cp ./btrfs-snap/btrfs-snap /usr/bin
