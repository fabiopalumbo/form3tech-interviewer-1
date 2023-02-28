resource "docker_container" "this" {
  image = var.docker_image
  name  = "gateway_production"

  ports {
    internal = var.port_internal
    external = var.port_external
  }


  env = [
    "VAULT_ADDR=http://vault-${var.environment}:8200",
    "VAULT_USERNAME=${var.docker_name}-${var.environment}",
    "VAULT_PASSWORD=123-{var.docker_name}-${var.environment}",
    "ENVIRONMENT=${var.environment}"
  ]

  networks_advanced {
    name = "vagrant_${var.environment}"
  }

  lifecycle {
    ignore_changes = all
  }
}
