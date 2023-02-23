module "vault_dev" {
  address = local.address
  token   = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
  "db_user":   "account",
  "db_password": "965d3c27-9e20-4d41-91c9-61e6631870e7"
}

module "vault_stg" {
  address = local.address
}

module "vault_prod" {
  address = local.address
}

module "docker_container_dev" {

}
module "docker_container_stg" {
  
}
module "docker_container_prod" {
  
}
