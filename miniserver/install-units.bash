#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

SD_PATH="/etc/systemd/system"

cp -f *.service ${SD_PATH}
cp -f *.timer ${SD_PATH}

systemctl daemon-reload


TOOL_PATH="/opt/clang"

mkdir -p ${TOOL_PATH}
cp -f *.sh ${TOOL_PATH}


systemctl enable backup-server.timer
systemctl start backup-server.timer
systemctl enable git-archive.timer
systemctl start git-archive.timer