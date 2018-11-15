Role nginx
=========

This role implements an initial configuration of Nginx templating the configuration file


Role Variables
--------------

* `bind_port`: TCP port Nginx will be listening to

Dependencies
------------

This role assumes you have previously installed Nginx using either [yum](../yum/nginx.md) or [source](../source/nginx.md) roles, as it uses some of their variables.

References
----------

Nginx Documentation (http://nginx.org/en/docs/)
