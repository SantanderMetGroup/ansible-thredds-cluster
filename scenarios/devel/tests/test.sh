#!/bin/bash

trap "exit" INT

SCENARIOS=(binary conda source)
COOKIE=cookie.txt
HOSTS=(proxy hostA)

function setup() {
    pushd ..
    # clean previous deployments
    (vagrant destroy -f && vagrant up ${HOSTS[*]}) || { echo "Failed at setup"; final; }
    popd
}

function deploy() {
    pushd ..
    ansible-playbook $1.yml || { echo "Failed to deploy scenario $1"; final; }
    ansible-playbook $1.yml --tags restart || { echo "Failed to restart scenario $1"; final; }
    popd
}

function test(){
    PUBLIC='http://localhost:9000/thredds/dodsC/collection1/singleDataset.nc.html'
    RESTRICTED='http://localhost:9000/thredds/dodsC/collection2/singleDataset.nc.html'
    USER='alice'
    PASSWORD='1234'

    CURL_OPTS="--referer ';auto' -v -o /dev/null -L --cookie-jar $COOKIE -b $COOKIE --fail"

    curl $CURL_OPTS $PUBLIC || { echo "Failed while downloading public dataset"; final; }
    curl $CURL_OPTS -u alice:1234 $RESTRICTED || { echo "Failed while downloading restricted dataset"; final; }
}

function clean() {
    pushd ..
    vagrant destroy -f
    popd
    
    rm $COOKIE
}

function final() {
    popd
    exit 1
}

# main
for s in "${SCENARIOS[@]}"; do
    setup
    sleep 5s
    deploy $s

    # wait 10s, else 503 is returned
    sleep 10s
    
    test
    clean
done
