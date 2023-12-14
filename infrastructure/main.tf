## AWS

module "aws" {
  source = "./aws/accounts/sfgov-tis-sandbox"
}

output "drupal7_dpa_public_ip_address" {
  value = module.aws.drupal7_dpa_public_ip_address
}

# TODO: This will just be a repeated template to copy from.
# output "drupal7_foobar_public_ip_address" {
#   value = module.aws.drupal7_foobar_public_ip_address
# }
