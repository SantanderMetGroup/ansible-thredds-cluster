# nginx-centos

Role to install Nginx from package administrator repositories; it also creates a directory for static content (.png, .css, etc.) and sets the Ansible fact _nginx_bin_ (i.e. nginx executable)


## Defaults

```nginx
centos_version: Centos Major Version of remote host
architecture: CPU architecture of remote host
nginx_repo_url: URL for repository update
nginx_root: Nginx root directory
nginx_static: Path to Nginx static content directory
nginx_conf: Path to Nginx's configuration file
```

## Vars

```nginx
```
