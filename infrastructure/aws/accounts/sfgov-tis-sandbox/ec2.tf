# data "aws_availability_zones" "available" {}

resource "aws_instance" "sfdbi_7_99_ec2" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t3.micro"

  key_name = "id_rsa.drupal"

  tags = {
    Name                = "SFDBI-7.99"
    Site_Name           = "SFDBI"
    Site_Drupal_Version = "7.99"
    Instance            = "EC2"
  }
}

output "sfdbi_7_99_ec2_public_ip_address" {
  value = aws_instance.sfdbi_7_99_ec2.public_ip_address
}
