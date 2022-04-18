terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "4.4.0"
      }
  }
}

provider "aws" {

  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"
  
}

resource "aws_s3_bucket" "state" {
  bucket= "terraform-state"
  force_destroy = true
}
