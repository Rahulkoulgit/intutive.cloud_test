variable "aws_region" {}

variable "instance_type" {}

variable "instance_count" {}

variable "ebs_volume_size" {}

variable "vpc_subnet_id" {}

resource "aws_instance" "main" {
  count         = var.instance_count
  ami           = "ami-12345678"  # Replace with the desired AMI ID
  instance_type = var.instance_type
  subnet_id     = var.vpc_subnet_id

  tags = {
    Name = "EC2Instance-${count.index}"
  }
}

resource "aws_ebs_volume" "main" {
  count           = var.instance_count
  availability_zone = "${var.aws_region}a"
  size            = var.ebs_volume_size
  tags = {
    Name = "EBSVolume-${count.index}"
  }
}

resource "aws_volume_attachment" "main" {
  count       = var.instance_count
  device_name = "/dev/sdf"
  instance_id = aws_instance.main[count.index].id
  volume_id   = aws_ebs_volume.main[count.index].id
}

resource "aws_s3_bucket" "main" {
  bucket = "my-terraform-bucket-rahulkoul"
  acl    = "private"

  tags = {
    Name = "TerraformBucket"
  }
}