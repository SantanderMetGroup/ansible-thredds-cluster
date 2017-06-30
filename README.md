# ansible-opendap-cluster 

## Overview

[Ansible] repository for deploying a load balancing system with a cluster of [Tomcat] server instances as backend and an [Apache HTTPD Server] as frontend.

This repository provides two different Ansible playbooks:
 1. Deploy a proxy-host using Apache HTTPD Server
 2. Deploy a worker-host using [THREDDS Data Server] (TDS)

## Usage

In both cases, there are **three** different type of uses:

 1. Install service (HTTPD/Tomcat) from RedHat repository and control them with System service (as root user)
 2. Install service (HTTPD/Tomcat) from source and control them with System service (as root user)
 3. Install service (HTTPD/Tomcat) from source and control them with [Supervisord] (as non-root user)

### Deploying a machine with [Apache HTTPD Server]

This Ansible playbook deploys an Apache HTTPD Server as a load balancer with Tomcat instances as backend.

#### Role variables

The following variables can be modified by the user depends on which case of use you want:

- ##### Common variables

  - `httpd_install_from_source`: Variable to indicate whether you want to install HTTPD from RedHat repository or from the source (bool, default: `false` [RedHat])
  - `httpd_system`: Variable to indicate whether you want to control HTTPD with system service or supervisord service (bool, default: `true` [System])
  - `load_balancer_module_default`: Variable to indicate which module you want to configure for load balancing system. There are **two** options: [mod_proxy] and [mod_jk] (string, default: `mod_jk`)
    - **_Jk module_ is installed from source while _proxy module_ is part of HTTPD modules**
  - `mod_jk_version`: Configure mod_jk version (string, default: `1.2.42`)
  - `mod_jk_mirror`: Configure mod_jk mirror site (string, default: `http://archive.apache.org/dist/tomcat/tomcat-connectors/jk`)


- ##### Case 1: RedHat and System control

  - `httpd_port`: Configure HTTPD port (int, default: `8008`)

- ##### Case 2: Source and System control
  
  - `httpd_version`: Configure HTTPD version (string, default: `2.4.25`)
  - `httpd_mirror`: Configure HTTPD mirror site (string, default: `http://apache.mirrors.tds.net/httpd`)
  - `httpd_home`: Configure base/installation directory for HTTPD (string, default: `/etc/httpd`)
  - `httpd_port`: Configure HTTPD port (int, default: `8008`)
  - `apr_version`: Configure APR version (string, default: `1.5.2`)
  - `apr_mirror`: Configure APR mirror site (string, default: `http://archive.apache.org/dist/apr`)
  - `apr_util_version`: Configure APR-util version (string, default: `1.5.4`)
  - `apr_util_mirror`: Configure APR-util mirror site (string, default: `http://archive.apache.org/dist/apr`)
  - `pcre_version`: Configure PCRE version (string, default: `8.40`)
  - `pcre_mirror`: Configure PCRE mirror site (string, default: `http://ftp.cs.stanford.edu/pub/exim/pcre`)

- ##### Case 3: Source and Supervisord control 

  - `services_home`: Configure path for install virtual enviroment and supervisord (string, default: `$HOME/ansible`)
  - `supervisor_port`: Configure Supervisord port (int, default: `9001`)
  - `virtualenv_version`: Configure virtual enviroment version (string, default:`15.1.0`)
  - `virtualenv_name`: Configure virtual enviroment's name (string, default: `virtualenv`)
  - `httpd_version`: Configure HTTPD version (string, default: `2.4.25`)
  - `httpd_mirror`: Configure HTTPD mirror site (string, default: `http://apache.mirrors.tds.net/httpd`)
  - `httpd_home`: Configure base/installation directory for HTTPD (string, default: `$HOME/httpd`)
  - `httpd_port`: Configure HTTPD port (int, default: `8000`)
  - `apr_version`: Configure APR version (string, default: `1.5.2`)
  - `apr_mirror`: Configure APR mirror site (string, default: `http://archive.apache.org/dist/apr`)
  - `apr_util_version`: Configure APR-util version (string, default: `1.5.4`)
  - `apr_util_mirror`: Configure APR-util mirror site (string, default: `http://archive.apache.org/dist/apr`)
  - `pcre_version`: Configure PCRE version (string, default: `8.40`)
  - `pcre_mirror`: Configure PCRE mirror site (string, default: `http://ftp.cs.stanford.edu/pub/exim/pcre`)

#### Examples

The following codes are ansible playbook examples, that you should create, for deploying Apache HTTPD Server. You can find an example of that in `scenarios/ceda/deploy_httpd.yml`
**Before running `deploy_httpd.yml` script you must run `provision_httpd.yml` to ensure all requirements are installed.**
> `proxy-secret.yml` contains the username and the password for the HTTPD status websites (server-status, balancer-status[mod-proxy/mod-jk]). If you use the Case 3 (Source and Supervisord control), this file also contains the username and the password for Supervisord application. The structure of this file is the following one:
```
applications:
  supervisord:
    user: abcd1234
    password: abcd1234
  proxy:
    status:
      user: efgh5678
      password: efgh5678
```

  - ##### Case 1: RedHat and System control (with proxy module)
      ```
        - name: Deploy httpd 
          hosts: host-proxy
          vars_files: 
            - proxy-secret.yml
          vars:
            load_balancer_module: mod_proxy
          roles:
            - role: httpd
      ```

  - ##### Case 2: Source and System control (with jk module)
      ```
        - name: Deploy httpd 
          hosts: host-proxy
          vars_files: 
            - proxy-secret.yml
          vars:
            httpd_install_from_source: true
            httpd_port: 8000
          roles:
            - role: httpd
      ```

  - ##### Case 3: Source and Supervisord control (with proxy module)
      ```
        - name: Deploy httpd 
          hosts: host-proxy
          vars_files: 
            - proxy-secret.yml
          vars:
            virtualenv_name: TDS4GWS
            httpd_install_from_source: true
            httpd_system: false
            load_balancer_module: mod_proxy
          roles:
            - role: httpd
      ```
> The TDS hosts must access into the host proxy in order to update the information about their Tomcat instances configuration and thus be able to perform the load balancing system. To restric this access, the host proxy administrator must manually configure the **authorized_keys** file as follows:
no-agent-forwarding,no-user-rc,no-port-forwarding,no-pty,command="/path/to/update_proxy.py --gwsEnforced [GWS name]", ssh-rsa [id_rsa.pub]

### Deploying a machine with [THREDDS Data Server]

The THREDDS Data Server needs a servlet container, such as Tomcat web server, to be installed. For this reason, this Ansible playbook deploys a THREDDS Data Server in a Tomcat instance for the load balancing system.

#### Role variables

The following variables can be modified by the user depends on which case of use you want:

- ##### Common variables

  - `tomcat_install_from_source`: Variable to indicate whether you want to install Tomcat from RedHat repository or from the source (bool, default: false [RedHat])
  - `tomcat_system`: Variable to indicate whether you want to control Tomcat with system service or supervisord service (bool, default: true [System])
  - `tds_version`: Configure TDS version (string, default: `4.6.8`)
  - `tds_mirror`: Configure TDS mirror site (string, default: `http://artifacts.unidata.ucar.edu/content/repositories/unidata-releases/edu/ucar/tds/`)
  - `proxyName`: frontend/proxy's name for *ALL* tomcat instances (default: `ansible_ssh_host` for your `host-proxy` host)
  - `proxyPort`: frontend/proxy's port for *ALL* tomcat instances (default: `8000`)
  - `tomcat_instances`: Configure tomcat instance values. The following variables are **compulsory** to configure per instance.
    - `name`: Name for the Tomcat instance. It should be unique. (e.g. `tds4gws_1800`)
    - `base_port`: Base port for Tomcat instance. It must be different if you have more than one Tomcat instances. (e.g. `1800`)
    - `ip_address`: External IP address for that Tomcat instance. (e.g. `192.168.33.13`) 
    - `ip_internal_address`: Internal IP address for that Tomcat instance. It should be noticed that IP address is used for doing the load balancing system.
      **Internal IP address is _not neccesary_ if you haven't problems with the firewall**
    - `http`: Configuration for HTTP Tomcat connector
      - `port`: Port for HTTP connector (default: `base_port`8)
    - `shutdown`: Configuration for Shutdown port
      - `port`: Port for shutdown port (default: `base_port`5)  
    - `ajp`: Configuration for ajp Tomcat connector and `mod_proxy`/`mod_jk` HTTPD module
      - `port`: AJP port. (default: `base_port`9)
      - `proxyName`: frontend/proxy's name (e.g. `192.168.33.12`)
      - `proxyPort`: frontend/proxy's port (e.g. `8000`)
    - `gws_instance`: Configuration for all GWS that this instance owns to.
         - `name`: Name of the gws served by the Tomcat instance. It must be the same as one of the `gws.name` variable (e.g. `cedaproc`)
  - `gws`: GWS configuration variables. The following variables are compulsory to configure per gws.
     - `name`: Name of the gws. This variable must be copy in the `tomcat_instances.gws_instance.name` (e.g. `cedaproc`)
     - `path`: URI for the publish dataset. (e.g. `cedaproc/test`)
     - `location`: Absolute path of the directory been published

> It should be notice that the shutdown, http and ajp connectors are *not* compulsory to be configured because there is a default configuration for all of these variables.

- ##### Case 1: RedHat and System control

  - `tomcat_instances_path`: Configure base directory for Tomcat instances (string, default: `/var/tomcat`). It's the base for `CATALINA_BASE` for each Tomcat instance. `CATALINA_HOME` is on `/usr/share/tomcat`.

- ##### Case 2: Source and System control
  
  - `tomcat_catalina_home`: Configure base/installation for Tomcat. (string, default: `/usr/share/tomcat`)
  - `tomcat_instances_path`: Configure base directory for Tomcat instances (string, default: `/var/tomcat`). It's the base for `CATALINA_BASE` for each Tomcat instance.
  - `jre_version`: Configure JRE version (string, default: `8u121`)
  - `jre_mirror`: Configure JRE mirror site (string, default: `http://download.oracle.com/otn-pub/java/jdk/`)
  - `tomcat_version`: Configure Tomcat version (string, default: `8.0.42`) 
  - `tomcat_mirror`: Configure Tomcat mirror site (string, default: `http://archive.apache.org/dist/tomcat`)


- ##### Case 3: Source and Supervisord control 

  - `services_home`: Configure path for install virtual enviroment and supervisord (string, default: `$HOME/ansible`)
  - `supervisor_port`: Configure Supervisord port (int, default: `9001`)
  - `virtualenv_version`: Configure virtual enviroment version (string, default:`15.1.0`)
  - `virtualenv_name`: Configure virtual enviroment's name (string, default: `virtualenv`)
  - `tomcat_catalina_home`: Configure base/installation for Tomcat. (string, default: `$HOME/tomcat`)
  - `tomcat_instances_path`: Configure base directory for Tomcat instances (string, default: `$HOME/tomcat/tomcat_pool`). It's the base for `CATALINA_BASE` for each Tomcat instance.
  - `jre_version`: Configure JRE version (string, default: `8u121`)
  - `jre_mirror`: Configure JRE mirror site (string, default: `http://download.oracle.com/otn-pub/java/jdk/`)
  - `tomcat_version`: Configure Tomcat version (string, default: `8.0.42`) 
  - `tomcat_mirror`: Configure Tomcat mirror site (string, default: `http://archive.apache.org/dist/tomcat`)
  

#### Examples

The following codes are ansible playbook examples, that you should create, for deploying THREDDS Data Server. You can find an example of that in `scenarios/ceda/deploy_tds_[gws-name].yml`
**Before running `deploy_tds_[gws-name].yml` script you must run `provision_tds.yml` to ensure all requirements are installed.**
> `[gws-name]-secret.yml` contains the username and the password for the Tomcat Reload Catalog website for **each** GWS. **You must have one username/password per GWS that you deploy in your ansible playbook**. If you use the Case 3 (Source and Supervisord control), this file also contains the username and the password for Supervisord application. The structure of this file is the following one:
```
applications:
  supervisord:
    user: abcd1234
    password: abcd1234
  tds:
    cedaproc:
      user: efgh5678
      password: efgh5678
    hiresgw:
      user: 1234abcd
      password: 1234abcd
```

  - ##### Case 1: RedHat and System control (with **one** Tomcat instance)
      ```
        - name: Deploy tds
          hosts: cedaproc-tds4gws
          vars_files: 
            - cedaproc-secret.yml
          vars:
            tomcat_instances:
              - name: tds4gws_1800
                base_port: 1800
                ip_address: 192.168.33.13
                ajp: 
                  port: 18009
                  proxyPort: 8008
                  proxyName: 192.168.33.12 
                gws_instance: 
                  - name: "{{ gws.0.name }}"
            gws:
              - name: cedaproc
                path: cedaproc/test
                location: "/gws/cedaproc"
          roles:
            - role: tds
      ```

  - ##### Case 2: Source and System control (with **two** Tomcat instances)
      ```
        - name: Deploy tds
          hosts: cedaproc-tds4gws
          vars_files: 
            - cedaproc-secret.yml
          vars:
            tomcat_install_from_source: true
            tomcat_instances:
              - name: tds4gws_1800
                base_port: 1800
                ip_address: 192.168.33.13
                ajp: 
                  port: 18009
                  proxyPort: 8008
                  proxyName: 192.168.33.12
                gws_instance: 
                  - name: "{{ gws.0.name }}"

              - name: tds4gws_2800
                base_port: 2800
                ip_address: 192.168.33.13
                ajp: 
                  port: 28009
                  proxyPort: 8008
                  proxyName: 192.168.33.12
                gws_instance: 
                  - name: "{{ gws.0.name }}"
            gws:
              - name: cedaproc
                path: cedaproc/test
                location: "/gws/cedaproc"
          roles:
            - role: tds
      ```

  - ##### Case 3: Source and Supervisord control (with **two** Tomcat instances)
      ```
        - name: Deploy tds
          hosts: cedaproc-tds4gws
          vars_files: 
            - cedaproc-secret.yml
          vars:
            tomcat_install_from_source: true
            tomcat_system: false
            tomcat_instances:
              - name: tds4gws_1800
                base_port: 1800
                ip_address: 192.168.33.13
                ajp: 
                  port: 18009
                  proxyPort: 8008
                  proxyName: 192.168.33.12
                gws_instance: 
                  - name: "{{ gws.0.name }}"

              - name: tds4gws_2800
                base_port: 2800
                ip_address: 192.168.33.13
                ajp: 
                  port: 28009
                  proxyPort: 8008
                  proxyName: 192.168.33.12
                gws_instance: 
                  - name: "{{ gws.0.name }}"
            gws:
              - name: cedaproc
                path: cedaproc/test
                location: "/gws/cedaproc"
          roles:
            - role: tds
      ```
  - ##### Case 4: Any previous case  with more than *one* GWS (with **three** Tomcat instances)
    This is a very generic example.

      ```
        - name: Deploy tds
          hosts: tds4gws
          vars_files: 
            - tds4gws-secret.yml
          vars:
            tomcat_instances:
              - name: tds4gws_1800
                base_port: 1800
                ip_address: 192.168.33.13
                ajp: 
                  port: 18009
                  proxyPort: 8008
                  proxyName: 192.168.33.12
                gws_instance: 
                  - name: "{{ gws.0.name }}"

              - name: tds4gws_2800
                base_port: 2800
                ip_address: 192.168.33.13
                ajp: 
                  port: 28009
                  proxyPort: 8008
                  proxyName: 192.168.33.12
                gws_instance: 
                  - name: "{{ gws.1.name }}"

              - name: tds4gws_3800
                base_port: 3800
                ip_address: 192.168.33.13
                ajp: 
                  port: 38009
                  proxyPort: 8008
                  proxyName: 192.168.33.12
                gws_instance: 
                  - name: "{{ gws.0.name }}"
                  - name: "{{ gws.1.name }}"

            gws:
              - name: cedaproc
                path: cedaproc/test
                location: "/gws/cedaproc"
              
              - name: hiresgw
                path: cedaproc/test
                location: "/gws/hiresgw"
          roles:
            - role: tds
      ```
> If you want to push the Tomcat instances configuration into the host proxy, you should execute the `update_proxy.py` script that is in your home directory. 

[Ansible]: <http://docs.ansible.com/ansible/>
[Apache HTTPD Server]: <https://httpd.apache.org/>
[THREDDS Data Server]: <http://www.unidata.ucar.edu/software/thredds/current/tds/>
[Tomcat]: <http://tomcat.apache.org/>
[supervisord]: <http://supervisord.org/>
[mod_jk]: <http://tomcat.apache.org/connectors-doc/reference/apache.html>
[mod_proxy]: <https://httpd.apache.org/docs/2.4/mod/mod_proxy_balancer.html>