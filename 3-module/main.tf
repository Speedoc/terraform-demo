terraform {
  backend "s3" {
    bucket                      = "terraform-state"
    key                         = "demo-3.tfstate"
    region                      = "us-east-1"
    endpoint                    = "http://localhost:4566"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
    encrypt                     = true
  }
}

module "docker-1"{
  source = "./module"
  image_name = "bitnami/nginx"
  internal_port = "8080"
  external_port = "9090"
  docker_name = "nginx"
}
module "docker-2"{
  source = "./module"
  image_name = "docker/getting-started"
  internal_port = "80"
  external_port = "80"
  docker_name = "tutorial"
}