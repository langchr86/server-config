#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

ansible-galaxy install -r ${SCRIPT_DIR}/ansible/requirements.yml

ansible-playbook \
  --inventory 192.168.0.5, \
  ${SCRIPT_DIR}/ansible/playbook_backup.yml
