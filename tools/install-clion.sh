#!/usr/bin/env bash

VERSION="2018.3"

# install CLion
cd ~

echo "installing CLion ${VERSION}"
if [ ! -d "clion" ]; then
  wget -q https://download.jetbrains.com/cpp/CLion-${VERSION}.tar.gz
  mkdir clion
  tar -zxf CLion-*.tar.gz -C clion
  rm CLion-*.tar.gz

  echo "alias clion=\"~/clion/clion-${VERSION}/bin/clion.sh\"" >> ~/.bash_aliases
fi
