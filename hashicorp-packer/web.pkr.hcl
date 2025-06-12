packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_name" {
  type    = string
  default = "golden-ami-example"
}

source "amazon-ebs" "amazon-linux" {
  region                  = var.aws_region
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-x86_64-gp2"
      virtualization-type = "hvm"
      root-device-type     = "ebs"
    }
    owners      = ["amazon"]
    most_recent = true
  }

  instance_type           = "t2.micro"
  ssh_username            = "ec2-user"
  ami_name                = "${var.ami_name}-${timestamp()}"
}

build {
  name    = "golden-ami-build"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "shell" {
    script = "scripts/install-nginx.sh"
  }
}
