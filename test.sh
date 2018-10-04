#!/bin/bash

trap "exit" INT

GATEWAY_PORT=4000

function debug() {
    echo "Docker: $(docker --version)"
    echo "docker-compose: $(docker-compose --version)"
}

function docker_up() {
    docker-compose up --scale tds=2 -d tds
    docker-compose run ansible
}

function docker_down() {
    docker-compose stop && docker-compose rm -f
}

function test_curl() {
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
docker_up
echo 'End docker_up'
sleep 10s
echo 'End sleep'
test_curl
echo 'End curl'
#docker_down
