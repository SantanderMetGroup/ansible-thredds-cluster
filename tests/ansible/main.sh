#!/bin/bash

PLAYBOOK="/root/ansible/$1"

/usr/local/bin/ansible-playbook $PLAYBOOK
/usr/local/bin/ansible-playbook $PLAYBOOK --tags start,restart
