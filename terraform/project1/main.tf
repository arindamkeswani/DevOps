terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

# Create an instance
# resource "aws_instance" "my-first-server" {
#   ami = "ami-0e472ba40eb589f49"

#   instance_type = "t2.micro"

#   tags = {
#     Name = "terraform_project_1_sample_name_change"
#   }
# }
