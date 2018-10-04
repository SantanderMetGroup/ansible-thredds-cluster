#!/bin/bash

PLAYBOOK="/root/ansible/$1"

/usr/local/bin/ansible-playbook /root/ansible/provision.yml $PLAYBOOK
/usr/local/bin/ansible-playbook $PLAYBOOK --tags start,restart
