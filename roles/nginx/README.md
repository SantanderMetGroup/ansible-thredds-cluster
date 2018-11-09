Role nginx
=========

This role this role implements an initial configuration of Nginx templating the configuration file


Role Variables
--------------

bind\_address: IP address Nginx will be listening to (insert '*' or '' to listen on all interfaces)
bind\_port: TCP port Nginx will be listening to

Dependencies
------------

This role assumes you have previously installed Nginx using either[yum](nginx) or [source](nginx) roles, as it uses some of their variables.

References
----------

Nginx Documentation (http://nginx.org/en/docs/)
