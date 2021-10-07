// export PKR_VAR_aws_access_key=$YOURKEY
variable "aws_access_key" {
  type = string
  // default = "hardcoded_key"
}

// export PKR_VAR_aws_secret_key=$YOURSECRETKEY
variable "aws_secret_key" {
  type = string
  // default = "hardcoded_secret_key"
}

// export PKR_VAR_token=$YOURSECRETKEY
variable "token" {
  type = string
  // default = "hardcoded_secret_key"
}


packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/amazon"
    }
  }
}
source "amazon-ebs" "example" {
  ami_name   = "ga-runner-{{timestamp}}"
  access_key = var.aws_access_key
  secret_key =  var.aws_secret_key
  token = var.token
  region =  "us-east-1"
  ssh_username =  "ubuntu"
  instance_type = "t2.small"
  source_ami_filter {
    filters = {
       virtualization-type = "hvm"
       name = "secops/ubuntu-focal-20.04-amd64-server/*"
       root-device-type = "ebs"
    }
    owners = ["497282223643"]
    most_recent = true
  }
  subnet_id = "subnet-0f1e12a79851cf6f7"
  vpc_id = "vpc-08a729e3d718b4f7a"

}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "shell" {
    script       = "script.sh"
  }
}
