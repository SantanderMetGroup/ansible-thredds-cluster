#!/bin/bash
usage() { echo "Usage: $0 -r root_path -c catalogs_path -d datasets_path [-u]" 1>&2; exit 1; }

while getopts ":r:c:d:uh" o; do
    case $o in
	r)
	    r=${OPTARG}
	    ;;
	c)
	    c=${OPTARG}
	    ;;
	d)
	    d=${OPTARG}
	    ;;
	u)
	    u=true
	    ;;
	h)
	    usage
	    ;;
    esac
done

if [ $u ] ; then
    ansible-playbook standalone.yml --limit localhost -e root_path=$r -e catalogs_path=$c -e datasets_path=$d --tags update_catalogs
else
    ansible-playbook standalone.yml --limit localhost -e root_path=$r -e catalogs_path=$c -e datasets_path=$d
fi
