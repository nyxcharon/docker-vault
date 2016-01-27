#! /bin/sh

#If the user mounts in their own config, use that, otherwise use the built in config
if [ -f /config/vault.hcl ]; then
  echo "Using user provided config for vault"
  /usr/local/bin/dockerize -stdout /var/log/vault_audit.log /usr/local/bin/vault server -config=/config/vault.hcl
else
  echo "Using default config for vault"

  if [ ! -z "$CONSUL_ADDR" ]; then
    sed -i "s~CONSUL_IP~$CONSUL_ADDR~g" /etc/consul.hcl
  else
    echo "CONSUL_ADDR must be set"
    exit 1
  fi

  #If the VAULT_IP variable is set, set the advertise address, otherwise remove the line
  if [ -z "$VAULT_IP" ]; then
    sed -i '/SED_IP/d' /etc/consul.hcl
  else
    sed -i "s~SED_IP~$VAULT_IP~g" /etc/consul.hcl
  fi

  if [ ! -z "$CONSUL_PATH" ]; then
    sed -i "s/vault-prod/$CONSUL_PATH/g" /etc/consul.hcl
  fi
  
  /usr/local/bin/dockerize -stdout /var/log/vault_audit.log /usr/local/bin/vault server -config=/etc/consul.hcl
fi
