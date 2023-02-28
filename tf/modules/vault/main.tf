resource "vault_audit" "this" {
  type     = "file"

  options = {
    file_path = "/vault/logs/audit"
  }
}


resource "vault_auth_backend" "this" {
  type     = "userpass"
}


resource "vault_generic_secret" "this" {
\  path     = "secret/${var.environment}/${var.vault_name}"

  data_json = <<EOT
{
  "db_user":   "${var.vault_name}",
  "db_password": "${var.vault_password}"
}
EOT
}

resource "vault_policy" "this" {
  name     = "${var.vault_name}-${var.environment}"

  policy = <<EOT

path "secret/data/${var.environment}/${var.vault_name}" {
    capabilities = ["list", "read"]
}

EOT
}

resource "vault_generic_endpoint" "this" {
  depends_on           = [vault_auth_backend.this]
  path                 = "auth/userpass/users/${var.vault_name}-${var.environment}"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["${var.vault_name}-${var.environment}"],
  "password": "123-${var.vault_name}-${var.environment}"
}
EOT
}
