backend "consul" {
  address = "CONSUL_IP"
  path = "vault-prod"
  advertise_addr = "SED_IP"
}
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}
disable_mlock = true
