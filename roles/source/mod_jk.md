# source-modjk

Role to install mod_jk by downloading and compiling from source code it in every host.

## Required vars

```yaml
```

## Defaults

```yaml
downloads_tmp: "{{ playbook_dir }}/downloads"

mod_jk_version: "1.2.43"
mod_jk_filename_unarchive: "tomcat-connectors-{{ mod_jk_version }}-src"
mod_jk_filename: "{{ mod_jk_filename_unarchive }}.tar.gz"
mod_jk_mirror: http://archive.apache.org/dist/tomcat/tomcat-connectors/jk
mod_jk_download_url: "{{ mod_jk_mirror }}/{{ mod_jk_filename }}"

mod_jk_src: "{{ httpd_root }}/mod_jk_src"
mod_jk_conf: "{{ httpd_root }}/conf.d"
mod_jk_shm: "{{ httpd_root }}/logs/mod_jk.shm"
mod_jk_log: "{{ httpd_root }}/logs/mod_jk.log"
mod_jk_status: "{{ mod_jk_conf }}"
```

## Vars

```yaml
```