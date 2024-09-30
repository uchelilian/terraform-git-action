terraform {
    cloud {
        organization = "GithubAction" /// replace with your organization name
        workspaces {
          name = "GithubActions-workspace" /// replace with your workspace name
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
  region = "us-east-1"
}

resource "aws_s3_bucket" "new_bucket" {
  bucket = "demo-github-action-tf-cloud"

  object_lock_enabled = false

  tags = {
    Environment = "Prod"
  }
}