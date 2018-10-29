# source-jdk

Role to install Oracle JDK by downloading and extracting it in every host.

## Required vars

```yaml
jdk_root
```

## Defaults

```yaml
jdk_version: '8u181'
jdk_filename_unarchive: "jre-{{ jdk_version }}-linux-x64"
jdk_filename: "{{ jdk_filename_unarchive }}.tar.gz"
jdk_mirror: http://download.oracle.com/otn-pub/java/jdk/
jdk_download_url: http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
jdk_header: "Cookie: oraclelicense=accept-securebackup-cookie"
```

## Vars

```yaml
```
