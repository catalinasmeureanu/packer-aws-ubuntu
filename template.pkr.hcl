packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "region" {
  type    = string
  default = "eu-north-1"
}

variable "ami_prefix" {
  type    = string
  default = "base-ubuntu"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ubuntu-focal" {
  ami_name      = "${var.ami_prefix}-focal-${local.timestamp}"
  instance_type = "t2.micro"
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tag {
    key   = "Name"
    value = "catalina vault"
  }
}

build {
  sources = [
    "source.amazon-ebs.ubuntu-focal"
  ]

  provisioner "shell" {
    script       = "provision/tools.sh"
    pause_before = "10s"
    timeout      = "10s"
  }

  provisioner "shell" {
    script       = "provision/vault.sh"
    pause_before = "10s"
    timeout      = "10s"
  }
}
