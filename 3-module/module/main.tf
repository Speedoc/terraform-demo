variable "docker_name" {
  description = "Docker container name"
  type        = string
  default     = ""
}


variable "image_name" {
  description = "Docker image name"
  type        = string
  default     = ""
}

variable "internal_port" {
  description = "Docker container internal port"
  type        = string
  default     = ""
}

variable "external_port" {
  description = "Docker container external port"
  type        = string
  default     = ""
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
data "docker_registry_image" "docker" {
  name = var.image_name
}

resource "docker_image" "docker" {
  name          = data.docker_registry_image.docker.name
  pull_triggers = [data.docker_registry_image.docker.sha256_digest]
}

# Create a container
resource "docker_container" "foo" {
  image = docker_image.docker.latest
  name = var.docker_name
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}