terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-07ec4220c92589b40"
  instance_type = "t3.large"
  count = 2

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "lfclass-${count.index + 1}"
  }
}
