#! /bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

docker build --rm --tag=ansible-lint .

docker run \
  --rm \
  -v ${SCRIPT_DIR}/../ansible:/ansible:ro \
  ansible-lint \
  ansible-lint --exclude /root/.cache \
    /ansible/playbook_backup.yml \
    /ansible/playbook_claudia.yml \
    /ansible/playbook_main.yml \
    /ansible/playbook_mini.yml
