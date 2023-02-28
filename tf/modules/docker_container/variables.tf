# variables 

variable "region" {
  description     = "AWS Region"
  type            = string
  default         = "us-east-1"
}

variable "environment" {
  type = string
}

# Docker docker_container

variables "docker_image" {
  description     = "Image for docker container"
  type            = string
}

variables "docker_name" {
  description     = "Docker name for service"
  type            = string
}

variables "port_internal" {
  description     = "Internal ports of the Docker Container"
  type            = string
  default         = ""
}

variables "port_external" {
  description     = "External ports of the Docker Container"
  type            = string
  default         = ""
}