data "aws_availability_zones" "available" {}

resource "aws_lightsail_instance" "drupal7_dpa" {
  name              = "drupal7-dpa.ec2"
  availability_zone = data.aws_availability_zones.available.names[0]
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "medium_3_0"

  key_pair_name = "id_rsa.drupal"

  tags = {
    SiteName                   = "DPA"
    SiteDrupalVersion          = "7.99"
    SiteDrupalMajorVersionOnly = "7"
  }
}

output "drupal7_dpa_public_ip_address" {
  value = aws_lightsail_instance.drupal7_dpa.public_ip_address
}

# TODO: This will just be a repeated template to copy from.

# resource "aws_lightsail_instance" "drupal7_foobar" {
#   name              = "drupal7-foobar.ec2"
#   availability_zone = data.aws_availability_zones.available.names[0]
#   blueprint_id      = "ubuntu_22_04"
#   bundle_id         = "medium_3_0"

#   key_pair_name = "id_rsa.drupal"

#   tags = {
#     SiteName                   = "FOOBAR"
#     SiteDrupalVersion          = "7.99"
#     SiteDrupalMajorVersionOnly = "7"
#   }
# }

# output "drupal7_foobar_public_ip_address" {
#   value = aws_lightsail_instance.drupal7_foobar.public_ip_address
# }
