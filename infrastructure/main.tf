## AWS

module "aws" {
  source = "./aws/accounts/sfgov-tis-sandbox"
}

output "sfdbi_7_99_ec2_public_ip_address" {
  value = module.aws.sfdbi_7_99_ec2_public_ip_address
}

output "sfdbi_7_99_lightsail_public_ip_address" {
  value = module.aws.sfdbi_7_99_lightsail_public_ip_address
}
