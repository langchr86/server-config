#!/usr/bin/env bash

# install CLion
cd ~
if [ ! -d "clion" ]; then
  wget -q https://download.jetbrains.com/cpp/CLion-2018.3.tar.gz
  mkdir clion
  tar -zxf CLion-*.tar.gz -C clion

  echo "alias clion=\"~/clion/clion-2018.3/bin/clion.sh\"" >> ~/.bash_aliases
fi
