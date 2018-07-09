#!{{ ansible_user_shell }}

#Clear possible previous rules
ipvsadm -C
#Add service on load-balancer's private interface
ipvsadm -A -t {{ ansible_eth1.ipv4.address }}:{{ lb_bind_port }} -s rr
#Add real servers
{% for server in groups['servers'] %}
ipvsadm -a -t {{ ansible_eth1.ipv4.address }}:{{ lb_bind_port }} -r {{ hostvars[server]['ansible_eth1']['ipv4']['address'] }}:{{ tds_port }} -g
{% endfor %}
#Save rules
ipvsadm -S
