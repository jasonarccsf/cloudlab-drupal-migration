terraform {
  required_version = ">= 1.0.0"

  required_providers {
    # DOCS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    # ENVS: AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      ManagedBy  = "Terraform"
      Owner      = "Jason Riddle"
      Repository = "https://github.com/jasonarccsf/cloudlab-drupal-migration"
    }
  }
}
