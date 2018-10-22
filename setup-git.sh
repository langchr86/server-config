#!/usr/bin/env bash

sudo apt-get install -y \
  xbase-clients x11-common \
  git git-gui gitk

git config --global user.name "Christian Lang"
git config --global user.email "lang.chr86@gmail.com"
git config --global push.default simple
