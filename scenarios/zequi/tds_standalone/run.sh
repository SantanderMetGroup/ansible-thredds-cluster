#!/bin/bash
usage() { echo "Usage: $0 -r root_path [-u]" 1>&2; exit 1; }

while getopts ":r:uh" o; do
    case $o in
	r)
	    r=${OPTARG}
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
    ansible-playbook standalone.yml --limit localhost -e root=$r --tags update_catalogs
else
    ansible-playbook standalone.yml --limit localhost -e root=$r
fi
