#! /bin/sh

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

NAME=$1

ansible-vault encrypt --vault-id infra@${SCRIPT_DIR}/infra_pw ${NAME}
