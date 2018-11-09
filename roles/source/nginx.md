# source-Nginx

Role to install Nginx by downloading and compiling it from source code in every host; it also creates a directory for static content (.png, .css, etc.)

## Required vars

```nginx
dependencies: [nginx]
```

## Defaults

```nginx
nginx\_url\_prefix: http://nginx.org/download
nginx\_version: Nginx version (must be in format _nginx-x.y.z_)
nginx\_filename: Name for the downloaded file
nginx\_install_file: Directory in local host for downloaded file
nginx\_directory: Directory to extract downloaded file
nginx\_configure: Parameter passed for install configuration
nginx\_root: Nginx root directory
nginx\_static: Directory for Nginx static content
nginx\_bin: Path to Nginx's executable
nginx\_conf: Path to Nginx's configuration file
```

## Vars

```nginx
```
