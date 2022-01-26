#!/bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

IMAGE_NAME="bitwarden_backup"

function remove_image {
  docker rmi ${IMAGE_NAME}
}
trap remove_image EXIT

docker build . -t ${IMAGE_NAME}
# start container only and execute commands by hand
docker run --rm -it -v bitwarden_data:/data -v {{ bw_restore_folder }}:/restore ${IMAGE_NAME} /bin/bash
