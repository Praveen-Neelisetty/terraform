terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.48.0"
    }
  }

  backend "s3" {
    bucket         = "praveen-remote-state-s3"
    key            = "dynamic-demo"
    region         = "us-east-1"
    dynamodb_table = "remote-state-s3-locking"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}
