data "aws_availability_zones" "available" {}

resource "aws_lightsail_instance" "sfdbi_7_99_lightsail" {
  name              = "sfdbi-7.99.ec2"
  availability_zone = data.aws_availability_zones.available.names[0]
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "medium_3_0"

  key_pair_name = "id_rsa.drupal"

  tags = {
    Name                = "SFDBI-7.99"
    Site_Name           = "SFDBI"
    Site_Drupal_Version = "7.99"
    Instance            = "Lightsail"
  }
}

output "sfdbi_7_99_lightsail_public_ip_address" {
  value = aws_lightsail_instance.sfdbi_7_99_lightsail.public_ip_address
}
