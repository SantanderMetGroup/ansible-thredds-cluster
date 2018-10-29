# source-tomcat

Role to install Apache Tomcat by downloading and extracting it in every host.

## Required vars

```yaml
tomcat_home
tomcat_base
```

## Defaults

```yaml
tomcat_version: '8.0.42'
tomcat_version_major: "{{ tomcat_version[:1] }}"
tomcat_filename_unarchive: "apache-tomcat-{{ tomcat_version }}"
tomcat_filename: "{{ tomcat_filename_unarchive }}.tar.gz"
tomcat_mirror: http://archive.apache.org/dist/tomcat
tomcat_download_url: "{{ tomcat_mirror }}/tomcat-{{ tomcat_version_major }}/v{{ tomcat_version }}/bin/{{ tomcat_filename }}"
tomcat_to_be_removed: "['KEYS','LICENSE','NOTICE','RELEASE-NOTES','RELEASE-NOTES.html','RUNNING.txt','temp']"
```

## Vars

```yaml
```
