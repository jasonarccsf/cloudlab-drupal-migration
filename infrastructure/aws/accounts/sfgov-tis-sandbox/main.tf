data "aws_availability_zones" "available" {}

resource "aws_lightsail_instance" "dpa_7_99" {
  name              = "dpa-7.99.ec2"
  availability_zone = data.aws_availability_zones.available.names[0]
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "medium_3_0"

  key_pair_name = "id_rsa.drupal"

  tags = {
    Name                = "DPA-7.99"
    Site_Name           = "DPA"
    Site_Drupal_Version = "7.99"
  }
}

output "dpa_7_99_public_ip_address" {
  value = aws_lightsail_instance.dpa_7_99.public_ip_address
}
