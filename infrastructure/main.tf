## AWS

module "aws" {
  source = "./aws/accounts/sfgov-tis-sandbox"
}

output "dpa_7_99_public_ip_address" {
  value = module.aws.dpa_7_99_public_ip_address
}
