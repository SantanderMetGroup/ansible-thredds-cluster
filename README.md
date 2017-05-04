# ansible-opendap-cluster
Ansible playbooks for deployment of opendap cluster

# Steps

- The first time you create the machines:
	1. Create virtual machines. (`vagrant up`)
	2. Run provision.yml playbook (`ansible-playbook provision.yml`)
	3. Change your directory to the scenario where you want to work (e.g. `cd scenarios/ceda` or `cd scenarios/cofinoa`)

- If you reload or halt your machines:
	1. Run virtual machines. (`vagrant reload`) or (`vagrant halt` and `vagrant up`)
	2. Run reload_machine.yml playbook (`ansible-playbook reload_machine.yml`)
	3. Change your directory to the scenario where you want to work (e.g. `cd scenarios/ceda` or `cd scenarios/cofinoa`)

# Playbooks

- provision.yml: Run this playbook when you create your machines. This playbook creates an initial configuration in the remote machine.

- reload_machine.yml: Run this playbook when you shutdown and start your machine (`vagrant halt` & `vagrant up`) or when you reload it(`vagrant reload`). This playbook ensure supervisor is running.

# Scenarios

### ceda

- deploy_tds.yml: Deploy 1 TDS instance for only 1 Group Workspace

### cofinoa

- deploy_tds.yml: Deploy 2 TDS instances and 2 Group Workspaces, each one with only 1 TDS instance.

# Role variables
### HTTPD

  - `httpd_version`: Configure httpd version (string, default: `2.4.25`)
  - `httpd_mirror`: Configure httpd mirror site (string, default: `http://apache.mirrors.tds.net/httpd`)
  - `httpd_install_base`: Configure base/installation directory for httpd (string, default: `$HOME/ansible/httpd`)
  - `httpd_default_port`: Default httpd port when not configured (int, default: `8000`)
  - `apr_version`: Configure APR version (string, default: `1.5.2`)
  - `apr_mirror`: Configure APR mirror site (string, default: `http://archive.apache.org/dist/apr`)
  - `apr_util_version`: Configure APR-util version (string, default: `1.5.4`)
  - `apr_util_mirror`: Configure APR-util mirror site (string, default: `http://archive.apache.org/dist/apr`)
  - `pcre_version`: Configure PCRE version (string, default: `8.40`)
  - `pcre_mirror`: Configure PCRE mirror site (string, default: `http://ftp.cs.stanford.edu/pub/exim/pcre`)
  - `mod_jk_version`: Configure mod_jk version (string, default: `1.2.42`)
  - `mod_jk_mirror`: Configure mod_jk mirror site (string, default: `http://archive.apache.org/dist/tomcat/tomcat-connectors/jk`)

### TDS

  - `tds_version`: Configure TDS version (string, default: `4.6.8`)
  - `tds_mirror`: Configure TDS mirror site (string, default: `http://artifacts.unidata.ucar.edu/content/repositories/unidata-releases/edu/ucar/tds/`)
  - `tds_install_base`: Configure base/installation directory for TDS (string, default: `$HOME/ansible/tds`)
  - `jre_version`: Configure JRE version (string, default: `8u121`)
  - `jre_mirror`: Configure JRE mirror site (string, default: `http://download.oracle.com/otn-pub/java/jdk/`)
  - `tomcat_version`: Configure Tomcat version (string, default: `8.0.42`) 
  - `tomcat_mirror`: Configure Tomcat mirror site (string, default: `http://archive.apache.org/dist/tomcat`)

##### tds_instances

Instance configuration variables may get configured per instance. The following variables are compulsory to configure per instance.

  - `name`: Name for the TDS instance. It should be unique. (e.g. `hostC_1800`)
  - `base_port`: Base port for TDS instance. It must be different if you have more than one TDS instances. (e.g. `1800`)
  - `ip_address`: IP address for that TDS instance. (e.g. `192.168.33.13`) 
  - `ajp`: Configuration for mod_jk configuration
    - `port`: AJP port. It must contain the `base_port` (e.g. `18009`)
    - `proxyName`: frontend/proxy's name (e.g. `192.168.33.12`)
    - `proxyPort`: frontend/proxy's port (e.g. `8000`)
  - `catalog`: Name of the catalog served by the TDS instance. It must be the same as one of the `catalogs.name` variable (e.g. `cedaproc`)

##### catalogs

Catalog configuration variables for each Group Workspaces. The following variables are compulsory to configure per catalog.
  
  - `name`: Name of the catalog. This variable must be copy in the `tds_instances.catalog` (e.g. `cedaproc`)
  - `path`: URI for the publish dataset. (e.g. `cedaproc/test`)
  - `location`: Absolute path of the directory been published (e.g. `$HOME/ansible/gws/cedaproc`)

# Example playbook(s)

### HTTPD

### Default

This playbook will install HTTPD with default configuration.

```
- name: Deploy httpd 
  hosts: hostC
  roles:
    - role: httpd
```

### Changing the default configuration

```
- name: Deploy httpd 
  hosts: hostC
  vars:
    httpd_version: '2.2.32'
    httpd_install_base: '/opt'
    httpd_default_port: 8001
    apr_version: '1.5.1'
  roles:
    - role: httpd
```

### TDS

### One TDS instances for one Group Workspace with default configuration.

```
- name: Deploy tds
  hosts: hostD
  vars:
    tds_instances:
      - name: "hostD_1800"
        base_port: 1800
        ip_address: "192.168.33.13"
        ajp: 
          port: 18009
          proxyName: 192.168.33.12
          proxyPort: 8000
        catalog: "{{ catalogs.0.name }}"
    catalogs:
      - name: cedaproc
        path: cedaproc/test
        location: /home/vagrant/ansible/gws/cedaproc
  roles:
    - role: tds
```

### Two TDS instances for one Group Workspace with default configuration.

```
- name: Deploy tds
  hosts: hostD
  vars:
    tds_instances:
      - name: "hostD_1800"
        base_port: 1800
        ip_address: "192.168.33.13"
        ajp: 
          port: 18009
          proxyName: 192.168.33.12
          proxyPort: 8000
        catalog: "{{ catalogs.0.name }}"

      - name: "hostD_2800"
        base_port: 2800
        ip_address: "192.168.33.13"
        ajp: 
          port: 28009 
          proxyName: 192.168.33.12
          proxyPort: 8000
        catalog: "{{ catalogs.0.name }}"
    catalogs:
      - name: cedaproc
        path: cedaproc/test
        location: /home/vagrant/ansible/gws/cedaproc
  roles:
    - role: tds
```

### Two TDS instances and two Group Workspaces, each TDS instance for one GWS with default configuration.

```
- name: Deploy tds
  hosts: hostD
  vars:
    tds_instances:
      - name: "hostD_1800"
        base_port: 1800
        ip_address: "192.168.33.13"
        ajp: 
          port: 18009
          proxyName: 192.168.33.12
          proxyPort: 8000
        catalog: "{{ catalogs.0.name }}"

      - name: "hostD_2800"
        base_port: 2800
        ip_address: "192.168.33.13"
        ajp: 
          port: 28009 
          proxyName: 192.168.33.12
          proxyPort: 8000
        catalog: "{{ catalogs.1.name }}"
    catalogs:
      - name: cedaproc
        path: cedaproc/test
        location: /home/vagrant/ansible/gws/cedaproc
      - name: hiresgw
        path: hiresgw/test
        location: /home/vagrant/ansible/gws/hiresgw
  roles:
    - role: tds
```

### One TDS instances for one Group Workspace changing the default configuration.

```
- name: Deploy tds
  hosts: hostD
  vars:
    tds_version: '4.6.9'
    jre_version: '8u131'
    tomcat_version: '8.0.43'
    tds_instances:
      - name: "hostD_1800"
        base_port: 1800
        ip_address: "192.168.33.13"
        ajp: 
          port: 18009
          proxyName: 192.168.33.12
          proxyPort: 8000
        catalog: "{{ catalogs.0.name }}"

      - name: "hostD_2800"
        base_port: 2800
        ip_address: "192.168.33.13"
        ajp: 
          port: 28009 
          proxyName: 192.168.33.12
          proxyPort: 8000
        catalog: "{{ catalogs.0.name }}"
    catalogs:
      - name: cedaproc
        path: cedaproc/test
        location: /home/vagrant/ansible/gws/cedaproc
  roles:
    - role: tds
```