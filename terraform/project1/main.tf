terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

variable "access_key" {
  description = "access key"

}

variable "secret_access_key" {
  description = "secret access key"

}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_access_key
}


variable "subnet_prefix" {
  description = "cidr block for the subnet"
}



resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.subnet_prefix[0].cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = var.subnet_prefix[0].name
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.subnet_prefix[1].cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = var.subnet_prefix[1].name
  }
}

# # Create an instance
# # resource "aws_instance" "my-first-server" {
# #   ami = "ami-0e472ba40eb589f49"

# #   instance_type = "t2.micro"

# #   tags = {
# #     Name = "terraform_project_1_sample_name_change"
# #   }
# # }

# # 1. Create VPC
# resource "aws_vpc" "prod-vpc" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "proj_terra_VPC"
#   }
# }

# # 2. Create Internet Gateway
# resource "aws_internet_gateway" "prod-igw" {
#   vpc_id = aws_vpc.prod-vpc.id

#   tags = {
#     Name = "proj_terra_igw"
#   }
# }

# # 3. Create custom route table
# resource "aws_route_table" "prod-route-table" {
#   vpc_id = aws_vpc.prod-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.prod-igw.id
#   }

#   route {
#     ipv6_cidr_block = "::/0"
#     gateway_id      = aws_internet_gateway.prod-igw.id
#   }

#   tags = {
#     Name = "proj_terra_rt"
#   }
# }


# # 4. Create a subnet (On which the web server is going to reside)

# resource "aws_subnet" "subnet-1" {
#   vpc_id            = aws_vpc.prod-vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"


#   tags = {
#     Name = "prod-subnet"
#   }

# }

# # 5. Associate subnet with route table

# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.subnet-1.id
#   route_table_id = aws_route_table.prod-route-table.id
# }

# # 6. Allow ports 22, 80, 443 using Security Groups

# resource "aws_security_group" "allow_web" {
#   name        = "allow_web_traffic"
#   description = "Allow Web inbound traffic"
#   vpc_id      = aws_vpc.prod-vpc.id

#   ingress {
#     description      = "HTTPS"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   ingress {
#     description      = "HTTP"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   ingress {
#     description      = "SSH"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
    
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_web"
#   }
# }
# # 7. Create network interface with an IP in the previously created subnet

# resource "aws_network_interface" "web-server-nic" {
#   subnet_id       = aws_subnet.subnet-1.id
#   private_ips     = ["10.0.1.50"]
#   security_groups = [aws_security_group.allow_web.id]

# }

# # 8. Assign Elastic IP to the network interface

# resource "aws_eip" "one" {
#   vpc                       = true
#   network_interface         = aws_network_interface.web-server-nic.id
#   associate_with_private_ip = "10.0.1.50"
#   depends_on                = [aws_internet_gateway.prod-igw]
# }


# # 9. Create Ubuntu server and install/enable apache2

# resource "aws_instance" "web-server-instance" {
#   ami = "ami-0e472ba40eb589f49"

#   instance_type     = "t2.micro"
#   availability_zone = "us-east-1a"
#   key_name          = "PepKeyPair"

#   network_interface {
#     device_index         = 0
#     network_interface_id = aws_network_interface.web-server-nic.id
#   }

#   #  bash commands to install apache2
#   user_data = <<-EOF
#                 #!/bin/bash
#                 sudo apt update -y
#                 sudo apt install apache2 -y
#                 sudo systemctl start apache2
#                 sudo bash -c 'echo your very first web server > /var/www/html/index.html'
#                 EOF

#   tags = {
#     Name = "web-server"
#   }

# }

# #OUTPUT
# output "server_public_ip" {
#     value = aws_eip.one.public_ip
# }

# output "server_private_ip" {
#   value = aws_instance.web-server-instance.private_ip

# }

# output "server_id" {
#   value = aws_instance.web-server-instance.id
# }
