# Role jk-gateway

Here follows the documentation of the role jk-gateway. This role deploys mod_jk in order to act as a reverse proxy for the TDS cluster. It can be used with an existing httpd installation or after executing the httpd role.

## Role dependencies

Although this role does not define any dependencies in the `meta/` directory, it is supposed to be used on top of one of the `httpd` roles. It can also be used in top of an existing httpd installation that was previously carried out without any of the roles provided by this project, as it is the case of the ESGF scenario.

## Role usage

If you want to deploy the status worker, you have to declare the following variables:

- `mod_jk_status_user`: User to login
- `mod_jk_status_passwd`: Password to login

If they are not declared, the `.htpasswd` file is not created.

## Variables

These variables control the deployment of the reverse proxy based on the underlying httpd installation. Default values assume that httpd has been installed using one of the provided httpd roles or that httpd has been installed from system packages.

- `mod_jk_version`: `"1.2.43"`
- `mod_jk_filename_unarchive`: `"tomcat-connectors-{{ mod_jk_version }}-src"`
- `mod_jk_filename`: `"{{ mod_jk_filename_unarchive }}.tar.gz"`
- `mod_jk_mirror`: `http://archive.apache.org/dist/tomcat/tomcat-connectors/jk`
- `mod_jk_download_url`: `"{{ mod_jk_mirror }}/{{ mod_jk_filename }}"`
- `mod_jk_src`: `"{{ ansible_env.HOME }}/mod_jk_src"`
- `mod_jk_conf_path`: `"{{ httpd_server_root | default('/etc/httpd') }}/conf.d"`
- `mod_jk_shm`: `"{{ httpd_server_root | default('/etc/httpd') }}/logs/mod_jk.shm"`
- `mod_jk_log`: `"{{ httpd_server_root | default('/etc/httpd') }}/logs/mod_jk.log"`
- `mod_jk_static_catalog`: `True`
- `mod_jk_status_path`: `"{{ mod_jk_conf_path }}"`

The `mod_jk_static_catalog` variable is used to indicate if the role should create static html files imitating THREDDS html catalog files in the reverse proxy. It is true by default and explicitly set to false in the ESGF scenario.

The `mod_jk_status_passwd` variable sets the path of the .htpasswd file that contains the user and password for the login in the jk status worker.

## Documentation

