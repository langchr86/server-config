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


systemctl enable btrfs-status.timer
systemctl start btrfs-status.timer

systemctl enable snapshots.timer
systemctl start snapshots.timer

systemctl enable backup-pull.timer
systemctl start backup-pull.timer

systemctl enable synced-media.timer
systemctl start synced-media.timer

systemctl enable jdownloader2.service
systemctl enable kodidb.service
