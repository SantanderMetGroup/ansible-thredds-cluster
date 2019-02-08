#!/bin/bash

requests() {
	DATASET1="http://$1:$2/thredds/dodsC/test/testData.nc.html"
	DATASET2="http://$1:$2/thredds/dodsC/testRestricted/testData.nc.html"
	USER='alice'
	PASSWORD='1234'

	CURL_OPTS='--fail --referer ";auto" -v -o /dev/null -L --cookie-jar /tmp/cookie.txt -b /tmp/cookie.txt'

	curl $CURL_OPTS $DATASET1
	curl $CURL_OPTS -u alice:1234 $DATASET2
}

requests lb 8080
rm /tmp/cookie.txt
