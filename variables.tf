variable "aws_region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"  # Update with your desired region
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"  # Update with your desired CIDR block
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.0.0/24"  # Update with your desired CIDR block
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
  default     = "t2.micro"  # Update with your desired instance type
}

variable "instance_count" {
  description = "The number of EC2 instances to create."
  type        = number
  default     = 2
}

variable "ebs_volume_size" {
  description = "The size of the EBS volume in GB."
  type        = number
  default     = 10
}
