# source-supervisor

Role to install supervisor (process control system) by downloading and extracting it in every host, inside a python virtualenv. Virtualenv is also downloaded and extracted into every host.

## Required vars

```yaml
venv_home
```

## Defaults

```yaml
downloads_tmp: "{{ playbook_dir }}/downloads"

venv_version: 15.1.0
venv_file_name: "virtualenv-{{ venv_version }}.tar.gz"
venv_file_url: "https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-{{ venv_version }}.tar.gz#md5=44e19f4134906fe2d75124427dc9b716"
venv_sw: "{{ venv_home }}/sw"

supervisor_home: "{{ venv_home }}"
supervisor_etc: "{{ supervisor_home }}/etc/supervisord"
supervisor_var: "{{ supervisor_home }}/var"
supervisor_programs: "{{ supervisor_etc }}/conf.d"
```

## Vars

```yaml
```