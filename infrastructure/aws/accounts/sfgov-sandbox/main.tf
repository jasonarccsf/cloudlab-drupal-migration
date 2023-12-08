data "aws_availability_zones" "available" {}

resource "aws_lightsail_instance" "instance" {
  name              = "drupal.ec2"
  availability_zone = data.aws_availability_zones.available.names[0]
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "medium_3_0"

  key_pair_name = "jason-riddle"
}

resource "aws_lightsail_key_pair" "key_pair" {
  name       = "jason-riddle"
  public_key = file("~/.ssh/id_rsa.pub")
}
