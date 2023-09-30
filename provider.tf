terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.1"
    }
  }

  backend "s3" {
    bucket         = "sfm-infra-state"
    key            = "dms-remote-backend/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
  # profile = "default"
}