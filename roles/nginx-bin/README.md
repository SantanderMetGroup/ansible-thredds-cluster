Role nginx-bin
=========

This role installs nginx from packages repository and makes an initial Layer 7 load balancing configurations. Further configuration is required by running the role nginx-gateway-tds.


Role Variables
--------------
* `nginx_repos_url`: URL for updating the repository in order to properly install nginx using yum
* `nginx_path_prefix`: directory where several nginx's files will be installed, including *nginx.conf*
* `nginx_conf_filename`: name of the configuration file
* `nginx_conf_file`: full path to nginx's configuration file
* `bind_port`: the port where the load balancer will be listening to

