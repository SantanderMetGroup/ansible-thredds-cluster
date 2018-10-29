#!/bin/bash

PLAYBOOK="/ansible-thredds-cluster/tests/ansible/$1"

/usr/local/bin/ansible-playbook $PLAYBOOK &&
/usr/local/bin/ansible-playbook $PLAYBOOK --tags restart
