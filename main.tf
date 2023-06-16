module "vpc" {
  source          = "./modules/vpc"
  aws_region      = var.aws_region
  vpc_cidr_block  = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
}

module "ec2" {
  source            = "./modules/ec2"
  aws_region        = var.aws_region
  instance_type     = var.instance_type
  instance_count    = var.instance_count
  ebs_volume_size   = var.ebs_volume_size
  vpc_subnet_id     = var.vpc_subnet_id
  ami               = "ami-12345678"  # Replace with the desired AMI ID
}
