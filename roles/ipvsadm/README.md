Role ipvsadm
=========

This role performs an inital configuration of Linux Virtual Server in order to deploy a Direct Server Return infraestrucure. Load Balanced instances must register afterwards.

Role Variables
--------------

vip: Virtual IP. This will be the only visible IP for users.
bind_port: Port all instances including DSR Load Balancer will be listening to (__Important__: port redirection is not a possibility with DSR)
ipvs_rules: Path where ipvsadm's rules will be saved
ipvs_config: Path to ipvsadm's configuration file
