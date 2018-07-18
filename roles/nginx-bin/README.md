nginx-bin
=========

This role installs nginx compiling the source code and configures a very simple Layer 7 load balancing for a group of servers that must be confined in a groups called *servers*

Requirements
------------

The following requirements are needed on the remote host:

* gcc (compiling library) 

Role Variables
--------------

* `nginx_url_prefix`: mirror for source code's download
* `nginx_version`: version of nginx software
* `nginx_filename`: name of the file that will be downloaded
* `nginx_directory`: directory where downloaded tarball will be extracted
* `nginx_path_prefix`: directory where all nginx's folders and files will be places with installation
* `nginx_bin_path`: directory of nginx's executable
* `nginx_conf_path`: directory where the configuration file (*nginx.conf*) will be placed
* `nginx_pid_path`: directory where the file with the PID of the master process (*nginx.pid*) will be placed

* `tds_port`: the port where the servers application will be listening to
* `bind_port`: the port where the load balancer will be listening to (doesn't need to be the same as *tds_port*)


Dependencies
------------
No dependencies

Example Playbook
----------------

    - hosts: servers
      roles:
         - nginx-bin


