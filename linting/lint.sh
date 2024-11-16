#! /bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

docker build --rm --tag=ansible-lint .

docker run \
  --rm \
  -v ${SCRIPT_DIR}/../ansible:/ansible:ro \
  ansible-lint \
  /bin/bash -c "cd /ansible && cp -r tasks /tmp && ansible-lint -v --exclude /root/.cache"
