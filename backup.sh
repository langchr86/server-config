#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

ansible-galaxy install -f -r ${SCRIPT_DIR}/ansible/requirements.yml

export ANSIBLE_CONFIG=${SCRIPT_DIR}/ansible/ansible.cfg

ansible-playbook \
  --inventory clang@192.168.0.5, \
  --ask-become-pass \
  --vault-id infra@${SCRIPT_DIR}/infra_pw \
  --extra-vars 'ansible_python_interpreter=/usr/bin/python3' \
  ${SCRIPT_DIR}/ansible/playbook_backup.yml
