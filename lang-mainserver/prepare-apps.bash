#!/bin/bash

apt-get update

apt-get install git-core git-gui gitk
apt-get install tmux tree
apt-get install openssh-client openssh-server
apt-get install samba

git config --global user.name "Christian Lang"
git config --global user.email "lang.chr86@gmail.com"
