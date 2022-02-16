provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "my-ec2" {
  ami           = "ami-03fa4afc89e4a8a09"
  instance_type = lookup(var.instance_type, terraform.workspace)

}

variable "instance_type" {
  type = map(any)
  default = {
    default = "t2.small"
    stage   = "t2.micro"
    prod    = "t2.large"

  }
}