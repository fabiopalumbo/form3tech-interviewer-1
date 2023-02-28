module "vault_account_dev" {
  source  = "./modules/vault"

  env           = local.dev.env
  db_user       = local.dev.account.db_user
  de_password   = local.dev.account.db_password
}
/*
module "vault_stg" {
  address = local.address
}

module "vault_prod" {
  address = local.address
}

module "docker_container_dev" {
  source  = "./modules/vault"


}
module "docker_container_stg" {
  
}
module "docker_container_prod" {
  
}
*/