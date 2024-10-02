#! /bin/bash -e

PLAYBOOK=${1}

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}

sudo apt-get update
sudo apt-get install -y \
  python3 \
  python3-pip

sudo pip3 install \
  passlib \
  ansible

ansible-galaxy install -r ${SCRIPT_DIR}/ansible/requirements.yml

cat ${SCRIPT_DIR}/infra_pw > /tmp/infra_pw

export ANSIBLE_CONFIG=${SCRIPT_DIR}/ansible/ansible.cfg

ansible-playbook \
  --connection=local \
  --inventory 127.0.0.1, \
  --limit 127.0.0.1 \
  --vault-id infra@/tmp/infra_pw \
  --extra-vars 'ansible_python_interpreter=/usr/bin/python3' \
  --extra-vars "@${SCRIPT_DIR}/vagrant/vagrant_variables.json" \
  ${SCRIPT_DIR}/ansible/${PLAYBOOK}

rm -f /tmp/infra_pw
