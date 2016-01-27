# ################################################################
# DESC: Docker file to run Hashicorp Vault (vaultproject.io)
# ################################################################

FROM alpine:3.3
MAINTAINER Barry Martin <bobb.mrtn@gmail.com>

#Dockerize
RUN apk --update add wget
RUN wget --no-check-certificate https://github.com/jwilder/dockerize/releases/download/v0.0.4/dockerize-linux-amd64-v0.0.4.tar.gz
RUN tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.0.4.tar.gz

# Listener API tcp port
EXPOSE 8200
ADD vault /usr/local/bin/vault
ADD consul.hcl /etc/consul.hcl
ADD start.sh /start.sh
RUN touch /var/log/vault_audit.log

ENTRYPOINT ["/start.sh"]
