#!/bin/bash

apt-get update

apt-get install -y --no-install-recommends \
  btrfs-tools lvm2 smartmontools ledmon \
  git-core git-gui gitk \
  tmux tree htop iotop \
  openssh-client openssh-server \
  docker.io samba

git config --global user.name "Christian Lang"
git config --global user.email "lang.chr86@gmail.com"

cp .tmux.conf ~
cp tmux-helper.bash ~
cat .bashrc >> ~/.bashrc
cp git-prompt.bash ~

cp ./btrfs-snap/btrfs-snap /usr/bin
