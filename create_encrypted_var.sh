#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

NAME=$1

ansible-vault encrypt_string --vault-id infra@${SCRIPT_DIR}/infra_pw --stdin-name ${NAME}
