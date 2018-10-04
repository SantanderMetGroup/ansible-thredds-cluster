#!/bin/bash

# CTRL-C
trap "exit" SIGINT

# if any command fail, exit
#set -e

GATEWAY_PORT=4000
PLAYBOOKS=(conda.yml binary.yml)

function debug() {
    echo "$(docker --version)"
    echo "$(docker-compose --version)"
}

# deploy the playbook passed as parameter
function deploy() {
    # allow failing (because of supervisord)
    #unset errexit
    docker-compose up --scale tds=2 -d tds
    docker-compose run ansible /root/main.sh $1
    #set -e
}

function down() {
    docker-compose stop && docker-compose rm -f
}

function requests() {
    DATASET1="http://localhost:$GATEWAY_PORT/thredds/dodsC/collection1/singleDataset.nc.html"
    DATASET2="http://localhost:$GATEWAY_PORT/thredds/dodsC/collection2/singleDataset.nc.html"
    RESTRICTED="http://localhost:$GATEWAY_PORT/thredds/restrictedAccess/restringido"
    USER='alice'
    PASSWORD='1234'

    CURL_OPTS='--fail --referer ";auto" -v -o /dev/null -L --cookie-jar /tmp/cookie.txt -b /tmp/cookie.txt'

    curl $CURL_OPTS $DATASET1
    curl $CURL_OPTS -u alice:1234 $DATASET2
}

# main
debug

for i in "${PLAYBOOKS[@]}"
do
    deploy $i
    sleep 5s
    requests
    down
done
