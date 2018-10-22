#!/usr/bin/env bash

sudo apt-get install -y \
  tmux tree

cp .bash_aliases ~
cp .tmux.conf ~
cp tmux-helper.bash ~
cp git-helper.bash ~

cat .bashrc >> ~/.bashrc
