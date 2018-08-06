#!/bin/bash
usage() { echo 'Usage: ./run.sh -r root_path (deploy|boot|stop|restart)' 1>&2; exit 1; }

while getopts ":r:uh" o; do
    case $o in
	r)
	    r=${OPTARG}
	    ;;
	h)
	    usage
	    ;;
    esac
done

if [ "${@: -1}" = "deploy" ]; then
    ansible-playbook main.yml --limit localhost -e root=$r --skip-tags update_catalogs
else
    ansible-playbook main.yml --limit localhost -e root=$r --tags "${@: -1}"
fi
