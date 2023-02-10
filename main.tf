provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source      = "../terraform-modules/VPC"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = module.my_vpc.vpc_id
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../terraform-modules/EC2"
  ec2_count     = 1
  ami_id        = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
  subnet_id     = module.my_vpc.subnet_id
}