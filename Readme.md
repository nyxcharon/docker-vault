Docker-Vault
================

[![Image Layers](https://badge.imagelayers.io/nyxcharon/docker-vault:latest.svg)](https://imagelayers.io/?images=nyxcharon/docker-vault:latest)
[![Docker Registry](https://img.shields.io/docker/pulls/nyxcharon/docker-vault.svg)](https://registry.hub.docker.com/u/nyxcharon/docker-vault)


What
--------
This provides a dockerized image of [Hashicorps Vault](https://www.vaultproject.io/intro/index.html) using an alpine linux base
The image is using Alpine Linux 3.3 and Vault 0.5.2 

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
CONSUL_ADDR: The address for your consul server. Required. Example - "http://consul.service.consul:8500"  
VAULT_IP: The advertise address Vault should use. Example - "http://10.0.0.100:8200"  
CONSUL_PATH: The path that should be used for Vaults backend storage. The default is "vault-prod"  

Example:  
```
 docker run nyxcharon/docker-vault --net=host -e CONSUL_ADDR="http://consul.service.consul:8500" -e VAULT_IP="http://10.0.0.100:8200"
 ```
