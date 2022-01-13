#!/bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

IMAGE_NAME="bitwarden_backup"

function remove_image {
  docker rmi ${IMAGE_NAME}
}
trap remove_image EXIT

docker build . -t ${IMAGE_NAME}
# /data needs to be writable for sqlite3 .backup to work
docker run --rm -v bitwarden_data:/data -v {{ bw_backup_folder }}:/backup ${IMAGE_NAME}
