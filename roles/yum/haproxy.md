# yum-haproxy

Role to install HAProxy from package administrator repositories; it also copies some .html files for different HTTP errors and sets as an Ansible fact _haproxy_bin_ (i.e. haproxy executable)

## Required vars

```haproxy
dependencies: [haproxy]
```

## Defaults

```haproxy
haproxy_root: HAProxy's root directory
haproxy_conf: Path to HAProxy's configuration file
```

## Vars

```haproxy
```
