variable "region" {
  type = string
  description = "Select the region to provision resources"
}

variable "ami" {
  type = string
  description = "AMI ID of EC2 instance"
}

variable "instance_type" {
  type = string
  description = "The type of ec2 instance"
}