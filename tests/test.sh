#!/bin/bash

trap "exit" INT # CTRL-C
set -e # if any command fail, exit

PLAYBOOKS=${1:-"simple.yml"} # yum.yml -> catalina.sh not found because of systemd

requests() {
    DATASET1="http://$1:$2/thredds/dodsC/collection1/singleDataset.nc.html"
    DATASET2="http://$1:$2/thredds/dodsC/collection2/singleDataset.nc.html"
    RESTRICTED="http://$1:$2/thredds/restrictedAccess/restringido"
    USER='alice'
    PASSWORD='1234'

    CURL_OPTS='--fail --referer ";auto" -v -o /dev/null -L --cookie-jar /tmp/cookie.txt -b /tmp/cookie.txt'

    curl $CURL_OPTS $DATASET1
    curl $CURL_OPTS -u alice:1234 $DATASET2
}

for p in $PLAYBOOKS
do
    lxdock up
    ansible-playbook $p
    requests lb 4000
    lxdock destroy -f
done
