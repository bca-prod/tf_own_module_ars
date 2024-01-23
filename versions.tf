terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
  backend "s3" {
    bucket         = "tfstate-ym-bucket"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    profile        = "bca-master"
    dynamodb_table = "terraform_locks"
  }
}

provider "aws" {
  shared_config_files      = ["/home/vagrant/.aws/config"]
  shared_credentials_files = ["/home/vagrant/.aws/credentials"]
  profile                  = "bca-master"
  region                   = "ap-southeast-1"
}