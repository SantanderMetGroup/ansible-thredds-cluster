# source-haproxy

Role to install haproxy by downloading and compiling it from source code in every host; it also creates a directory for configuration files and copies some .html files for different HTTP errors.

## Required vars

```haproxy
```

## Defaults

```haproxy
haproxy_major_version: 1.8
haproxy_version: haproxy-1.8.12
haproxy_url: "{{ 'http://www.haproxy.org/download/' ~ haproxy_major_version ~ '/src/' ~ haproxy_version ~ '.tar.gz' }}"
haproxy_directory: "{{ ansible_env.HOME ~ '/haproxy_install'}}"
haproxy_install_file: "{{ playbook_dir ~ '/downloads/' ~ haproxy_version ~ '.tar.gz' }}"
haproxy_root: "{{ ansible_env.HOME ~ '/haproxy' }}"
haproxy_bin: "{{ haproxy_root ~ '/usr/local/sbin/haproxy' }}"
haproxy_conf_dir: "{{ haproxy_root ~ '/conf' }}"
haproxy_conf_file: haproxy.cfg
haproxy_errors: "{{ haproxy_root ~ '/errors' }}"
```

## Vars

```haproxy
```
