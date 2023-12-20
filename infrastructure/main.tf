## AWS

module "aws" {
  source = "./aws/accounts/sfgov-tis-sandbox"
}

output "sfdbi_7_99_public_ip_address" {
  value = module.aws.sfdbi_7_99_public_ip_address
}
