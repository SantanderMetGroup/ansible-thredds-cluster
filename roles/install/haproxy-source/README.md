# haproxy-source

Role to install HAProxy by downloading and compiling it from source code in every host; it also creates a directory for configuration files and copies some .html files for different HTTP errors.


## Defaults

```haproxy
haproxy\_major_version: HAProxy major version
haproxy\_version: Haproxy version, must be in format _haproxy-x.y.z_
haproxy\_url: HAProxy download URL
haproxy\_install_file: Path in local host to download HAProxy
haproxy\_directory: Path to unarchive downloaded file
haproxy\_root: HAProxy root directory
haproxy\_bin: Path to HAProxy's executable
haproxy\_conf_dir: Directory for HAProxy's configuration files
haproxy\_conf_file: Name of HAProxy's configuration file
haproxy\_errors: Directory for Haproxy's HTTP errors files
```

## Vars

```haproxy
```
