#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

ansible-galaxy install -r ${SCRIPT_DIR}/ansible/requirements.yml

ansible-playbook \
  --inventory clang@192.168.0.7, \
  --vault-id infra@${SCRIPT_DIR}/infra_pw \
  --extra-vars 'ansible_python_interpreter=/usr/bin/python3' \
  ${SCRIPT_DIR}/ansible/playbook_backup.yml
