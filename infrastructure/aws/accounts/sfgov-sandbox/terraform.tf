terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "TIS-SANDBOX.AWSAdministratorAccess"
  region  = "us-east-1"
}
