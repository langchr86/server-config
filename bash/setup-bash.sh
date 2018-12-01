#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

sudo apt-get install -y \
  tmux tree

cp .bash_aliases ~
cp .tmux.conf ~
cp tmux-helper.bash ~
cp git-helper.bash ~

cat .bashrc >> ~/.bashrc
