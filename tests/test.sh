#!/bin/bash

trap "exit" INT # CTRL-C
set -e # if any command fail, exit
cd ..

PROJECT_NAME="ansible-thredds-cluster"
PLAYBOOKS=${1:-"conda.yml source.yml"} # yum.yml -> catalina.sh not found because of systemd

debug() {
    echo "$(docker --version)"
    echo "$(docker-compose --version)"
}

# deploy the playbook passed as parameter
deploy() {
    docker-compose up --force-recreate --scale tds=2 -d
    docker run -t --network ansible-thredds-cluster_default $PROJECT_NAME /ansible-thredds-cluster/tests/ansible/main.sh $1
}

down() {
    docker-compose stop
}

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

# main
debug
export COMPOSE_PROJECT_NAME=$PROJECT_NAME

# if image ansible exists don't create it
if [[ "$(docker images -q $PROJECT_NAME 2> /dev/null)" == "" ]]; then
    docker build -t $PROJECT_NAME .
fi

for i in $PLAYBOOKS
do
    deploy $i
    sleep 5s
    requests localhost 4000
    down
done
