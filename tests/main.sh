#!/bin/bash

/usr/local/bin/ansible-playbook provision.yml conda.yml
/usr/local/bin/ansible-playbook conda.yml --tags start,restart
