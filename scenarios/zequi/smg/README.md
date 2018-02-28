# Scenario for SMG

## Usage

1. A public key pair with name 'id' is required (in .ssh directory)
1. git clone
2. cd scenarios/zequi/smg
3. git checkout devel
3. virtualenv ansible --no-site-packages
4. source ansible/bin/activate
5. pip install ansible
6. vagrant up proxy hostA && vagrant reload
7. ansible-playbook provision.yml devel.yml -u vagrant -i develInventory --ask-vault-pass
8. (in web browser) 192.168.50.11:8000/thredds, 192.168.50.11:8000/status-jk, 192.168.50.11:8000/tap
9. vagrant ssh proxy OR vagrant ssh hostA (to see how the deployment is performed, 'supervisorctl' command is available)
10. edit catalogs in gws1/ or gws2/
11. ansible-playbook deploy.yml --tags update_catalogs (catalogs should be updated in the browser)

## Roles

Description of the roles.

### supervisord-virtualenv

This role installs supervisord using the python found in the system and creating a virtualenv inside *venv_home*.

Default variables:

```yaml
venv_home: "{{ ansible_env.HOME }}"
venv_version: 15.1.0
venv_file_name: "virtualenv-{{ venv_version }}.tar.gz"
venv_file_url: "https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-{{ venv_version }}.tar.gz#md5=44e19f4134906fe2d75124427dc9b716"
venv_sw: "{{ venv_home }}/sw"

supervisord_etc: "{{ venv_home }}/etc"
supervisord_var: "{{ venv_home }}/var"
supervisord_programs: "{{ supervisord_etc }}/supervisord.d"
supervisord_port: 9001

tmp_dir: "/tmp"
```

### ansible-miniconda-role

Role for installing miniconda.

### supervisord-conda

This role installs supervisord using the miniconda installation performed by the role *ansible-miniconda-role*.

Default variables:

```yaml
# Set miniconda_prefix in the playbook for this to work
venv_home: "{{ miniconda_prefix }}"

supervisord_etc: "{{ venv_home }}/etc"
supervisord_var: "{{ venv_home }}/var"
supervisord_programs: "{{ supervisord_etc }}/supervisord.d"
supervisord_port: 9001

tmp_dir: "/tmp"
```

### httpd

Role for installing an apache httpd server, from source or from system binaries.
