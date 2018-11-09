# yum-nginx

Role to install Nginx from package administrator repositories; it also creates a directory for static content (.png, .css, etc.) and sets the Ansible fact _nginx_bin_ (i.e. nginx executable)

## Required vars

```haproxy
dependencies: [nginx]
```

## Defaults

```nginx
nginx_repo_url: http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
#nginx_repo_url: http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
nginx_root: Nginx root directory
nginx_static: Path to Nginx static content directory
nginx_conf: Path to Nginx's configuration file
```

## Vars

```nginx
```
