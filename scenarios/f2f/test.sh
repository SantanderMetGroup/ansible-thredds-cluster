#!/bin/bash

set -e
host=${1:-"esgf.test.es"}

requests() {
    dataset="https://$host/thredds/fileServer/esgcet/drs/Test/v20181201/sftlf.nc"
    openid_provider_submit="https://$host/esg-orp/j_spring_openid_security_check.htm"
    login_submit="https://$host/esgf-idp/idp/login_ids.htm"

    cookie=/tmp/cookie.txt

    user='pepito'
    password='Cochecitos1!'

    #certs='--cacert /root/ansible-thredds-cluster/scenarios/f2f/cachain.pem --key /etc/certs/hostkey.pem --cert /etc/certs/hostcert.pem'
    curl_opts="-s --insecure --referer ';auto' -v -o /dev/null -L --cookie-jar $cookie -b $cookie"

    > $cookie
    # Request dataset, this redirects us to the ORP
    curl $curl_opts $dataset

    # Submit the openid provider in the ORP, this redirects us to the IdP
    curl $curl_opts \
         -X POST \
         -d "openid_identifier=https://esgf.test.es/esgf-idp/openid/" \
         --referer "https://esgf.test.es/esg-orp/home.htm?redirect=https%3A%2F%2Fesgf.test.es%2Fthredds%2FfileServer%2Fesgcet%2Fdrs%2FTest%2Fv20181201%2Fsftlf.nc" \
         $openid_provider_submit

    # Submit the openid provider in the ORP, this redirects us to the IdP
    curl $curl_opts \
	 -X POST \
	 -d "openid_identifier=https://esgf.test.es/esgf-idp/openid/" \
	 --referer "https://esgf.test.es/esg-orp/home.htm?redirect=https%3A%2F%2Fesgf.test.es%2Fthredds%2FfileServer%2Fesgcet%2Fdrs%2FTest%2Fv20181201%2Fsftlf.nc" \
	 $openid_provider_submit

    # Submit username and password in IdP
    curl $curl_opts --fail \
	 --referer "https://esgf.test.es/esgf-idp/idp/login_ids.htm" -d "username=$user" -d "password=$password" \
	 $login_submit
}

# main
echo -n "HTTPS request for a netcdf file in $host"
requests

cat /tmp/cookie.txt
