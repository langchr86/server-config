#!/bin/bash

SD_PATH="/etc/systemd/system"

cp -f *.service ${SD_PATH}
cp -f *.timer ${SD_PATH}

systemctl daemon-reload


TOOL_PATH="/opt/clang"

mkdir -p ${TOOL_PATH}
cp -f *.sh ${TOOL_PATH}
