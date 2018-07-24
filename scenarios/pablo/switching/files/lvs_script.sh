#!/bin/bash

#Clear possible previous rules
ipvsadm -C
#Add service on load-balancer's private interface
ipvsadm -A -t 192.0.2.17:8080 -s rr
#Add real servers
ipvsadm -a -t 192.0.2.17:8080 -r 192.0.2.18:8080 -g
ipvsadm -a -t 192.0.2.17:8080 -r 192.0.2.15:8080 -g
#Save rules
ipvsadm -S -n > /etc/ipvsadm.rules
#To restore configurarion after reboot type:
# ipvsadm-restore < /etc/ipvsadm.rules
