#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

ansible-galaxy install -r ${SCRIPT_DIR}/ansible/requirements.yml

ansible-playbook \
  --inventory clang@192.168.0.6, \
  ${SCRIPT_DIR}/ansible/playbook_main.yml
