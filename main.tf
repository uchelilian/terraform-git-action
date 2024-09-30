terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" # define region as per your account
}

resource "aws_s3_bucket" "new-bucket" {
  bucket = "git-action-demo-bucket"

  object_lock_enabled = false

  tags = {
    Environment = "Prod"
  }
}