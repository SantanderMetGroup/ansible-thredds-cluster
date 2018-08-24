#!/bin/bash

#Clear possible previous rules
ipvsadm -C
#Add service on load-balancer's private interface
ipvsadm -A -t 192.0.2.126:8080 -s rr
#Make sure ipvsadm.rules exists
touch /etc/ipvsadm.rules
#Save rules
ipvsadm -S -n > /etc/ipvsadm.rules
#To restore configurarion after reboot type:
# ipvsadm-restore < /etc/ipvsadm.rules
