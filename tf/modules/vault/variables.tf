# variables 

variable "region" {
  description     = "AWS Region"
  type            = string
  default         = "us-east-1"
}

variable "environment" {
  type = string
}

# Vault

variables "vault_name" {
  description     = "Name of the Vault"
  type            = string
}

variables "vault_password" {
  description     = "Password for the vault"
  type            = string
  sensitive       = true
}