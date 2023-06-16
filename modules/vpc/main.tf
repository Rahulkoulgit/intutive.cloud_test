variable "aws_region" {}

variable "vpc_cidr_block" {}

variable "subnet_cidr_block" {}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

    lifecycle {
    ignore_changes = [tags]  # Ignore changes to tags
  }
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "MySubnet"
  }
}
