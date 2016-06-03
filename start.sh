#! /bin/sh

#If the user mounts in their own config, use that, otherwise use the built in config
if [ -f /config/vault.hcl ]; then
  echo "Using user provided config for vault"
  /usr/local/bin/dockerize -stdout /var/log/vault_audit.log -poll /usr/local/bin/vault server -config=/config/vault.hcl
else
  echo "Using default config for vault"
  /usr/local/bin/dockerize -template /config/consul.tmpl:/config/consul.hcl -stdout /var/log/vault_audit.log -poll /usr/local/bin/vault server -config=/config/consul.hcl
fi
