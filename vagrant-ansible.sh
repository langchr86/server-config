#! /bin/bash -e

PLAYBOOK=${1}

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

sudo apt-get update
sudo apt-get install ansible -y

ansible-galaxy install -r ${SCRIPT_DIR}/ansible/requirements.yml

chmod -x ${SCRIPT_DIR}/infra_pw

ansible-playbook \
  --connection=local \
  --inventory 127.0.0.1, \
  --limit 127.0.0.1 \
  --vault-id infra@${SCRIPT_DIR}/infra_pw \
  --extra-vars 'ansible_python_interpreter=/usr/bin/python3' \
  --extra-vars "@${SCRIPT_DIR}/vagrant/ssh_host_aliases.json" \
  ${SCRIPT_DIR}/ansible/${PLAYBOOK}
