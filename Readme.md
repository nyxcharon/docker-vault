Docker-Vault
================

[![Image Layers](https://badge.imagelayers.io/nyxcharon/docker-vault:latest.svg)](https://imagelayers.io/?images=nyxcharon/docker-vault:latest)
[![Docker Registry](https://img.shields.io/docker/pulls/nyxcharon/docker-vault.svg)](https://registry.hub.docker.com/u/nyxcharon/docker-vault)


What
--------
This provides a dockerized image of [Hashicorps Vault](https://www.vaultproject.io/intro/index.html) using an alpine linux base
The image is using Alpine Linux 3.3 and Vault 0.7.3

Configuration and Running
----------
You have two options - mount your own config file or use the built in via environment variables.

### Custom configuration file
Simply provide a config file and have it mounted at /config/vault.hcl, the startup script will do the rest

Example:  
```
 docker run nyxcharon/docker-vault --net=host -v /some/path/vault.hcl:/config/vault.hcl
 ```

### Built in
The built in configuration assumes you are using Consul as a backend. Set the following environment variables as needed:  
CONSUL_ADDR: The address for your consul server. Defaults localhost
ADVERTISE_ADDR: The advertise address Vault should use. Example - "http://localhost:8200"  
PATH: The path that should be used for Vaults backend storage. The default is "vault-prod"  
ADDRESS: Vault listener adddress. Default is "0.0.0.0:8200"  
TLS_DISABLE: Disable tls. Defaults to 0  
VAULT_KEY: Vault ssl key.  
VAULT_CERT: Vault ssl cert.  
CONSUL_DISABLE: Disable auto registration with consul. Defaults to true  
STATSITE_ADDR: The statsite server to send telemetry to. If this var does not exist, the telemetry section will not be created in the config

Example:  
```
 docker run nyxcharon/docker-vault --net=host -e CONSUL_ADDR="http://consul.service.consul:8500" -e ADVERTISE_ADDR="http://10.0.0.100:8200"
 ```
