#!/bin/bash

apt-get update

apt-get install btrfs-tools
apt-get install lvm2
apt-get install git-core git-gui gitk
apt-get install tmux tree
apt-get install openssh-client openssh-server
apt-get install samba
apt-get install docker.io

git config --global user.name "Christian Lang"
git config --global user.email "lang.chr86@gmail.com"

cp .tmux.conf ~
cp tmux-helper.bash ~
cat .bashrc >> ~/.bashrc
cp git-prompt.bash ~

cd ~
git clone https://github.com/jf647/btrfs-snap.git
cp ./btrfs-snap/btrfs-snap /usr/bin
