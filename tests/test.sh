#!/bin/bash

# CTRL-C
trap "exit" INT

# if any command fail, exit
set -e

# print commands as they execute
#set -x

GATEWAY_PORT=4000
PLAYBOOKS=${1:-"conda.yml"}

debug() {
    echo "$(docker --version)"
    echo "$(docker-compose --version)"
}

# deploy the playbook passed as parameter
deploy() {
    # allow failing (because of supervisord)
    #unset errexit
    docker-compose up --force-recreate --scale tds=2 -d
    docker run --network ansible-thredds-cluster_default ansible /root/ansible/main.sh $1
    #set -e
}

down() {
    docker-compose stop
}

requests() {
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
export COMPOSE_PROJECT_NAME="ansible-thredds-cluster"

# if image ansible exists don't create it
if [[ "$(docker images -q ansible 2> /dev/null)" == "" ]]; then
    (cd .. && docker build -t ansible -f tests/ansible/Dockerfile .)
fi

for i in $PLAYBOOKS
do
    deploy $i
    sleep 5s
    requests
    down
done
