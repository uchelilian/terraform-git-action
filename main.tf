terraform {
    cloud {
        organization = "medium-tf-test" /// replace with your organization name
        workspaces {
          name = "medium-test-workspace" /// replace with your workspace name
        }
      }
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

resource "aws_s3_bucket" "new_bucket" {
  bucket = "demo-github-action-tf-cloud"

  object_lock_enabled = false

  tags = {
    Environment = "Prod"
  }
}