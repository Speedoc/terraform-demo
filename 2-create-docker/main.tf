terraform {
  backend "s3" {
    bucket                      = "terraform-state"
    key                         = "demo-2.tfstate"
    region                      = "us-east-1"
    endpoint                    = "http://localhost:4566"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
    encrypt                     = true
  }
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
  name = "bitnami/nginx:latest"
}

resource "docker_image" "docker" {
  name          = data.docker_registry_image.docker.name
  pull_triggers = [data.docker_registry_image.docker.sha256_digest]
}

# Create a container
resource "docker_container" "foo" {
  image = docker_image.docker.latest
  name  = "getting-started"
  ports {
    internal = "8080"
    external = "8080"
  }
}