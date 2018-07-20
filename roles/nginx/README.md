Role nginx
=========

This role installs nginx from packages repository and configures a very simple Layer 7 load balancing for different servers that must be confined in a group called *servers*

Requirements
------------
Not requirements needed

Role Variables
--------------
* `nginx_repos_url`: URL for updating the repository in order to properly install nginx using yum
* `nginx_path_prefix`: directory where several nginx's files will be installed, including *nginx.conf*
* `tds_port`: the port where the application servers will be listening to
* `bind_port`: the port where the load balancer will be listening to (not neccessarily the same as *tds_port*)

Dependencies
------------
No dependencies

Example Playbook
----------------
    - hosts: load-balancer
      become: True
      roles:
         - nginx

