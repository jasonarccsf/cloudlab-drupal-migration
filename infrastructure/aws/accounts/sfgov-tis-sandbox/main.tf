data "aws_availability_zones" "available" {}

resource "aws_lightsail_instance" "drupal_7" {
  name              = "drupal-7.ec2"
  availability_zone = data.aws_availability_zones.available.names[0]
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "medium_3_0"

  key_pair_name = "id_rsa.drupal"
}
