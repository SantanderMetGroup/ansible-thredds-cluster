#!/bin/bash

#Clear possible previous rules
ipvsadm -C
#Add service on load-balancer's private interface
ipvsadm -A -t 172.28.128.3:8080 -s rr
#Add real servers
ipvsadm -a -t 172.28.128.3:8080 -r 172.28.128.4:8080 -g
ipvsadm -a -t 172.28.128.3:8080 -r 172.28.128.5:8080 -g
#Save rules
ipvsadm -S
