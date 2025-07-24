provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  key_name = ""
  tags = {
    Name = "web-${terraform.workspace}"
    Environment = "${terraform.workspace}"
    }
}