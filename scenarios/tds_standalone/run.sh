#!/bin/bash
usage() { echo 'Usage: ./run.sh -r root_path [-u] (deploy|boot|stop|restart)' 1>&2; exit 1; }

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

if [ "${@: -1}" = "deploy" ]; then
	if [ $u ] ; then
		ansible-playbook standalone.yml --limit localhost -e root=$r --tags update_catalogs
	else
		ansible-playbook standalone.yml --limit localhost -e root=$r
	fi
else
	ansible-playbook standalone.yml --limit localhost -e root=$r --tags "${@: -1}"
fi
