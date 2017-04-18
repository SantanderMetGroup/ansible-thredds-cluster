#!/bin/bash
 
if [ ! -f /usr/bin/ansible-playbook ]
then
  sudo yum install -y epel-release
  sudo yum install -y ansible
fi
 
ansible-playbook --inventory="localhost," -c local /vagrant/provision.yml