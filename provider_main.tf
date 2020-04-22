#Configuring the AWS provider

provider "aws" {
  region = "${var.region-name}"
}

#Configuring the VPC
resource "aws_vpc" "glb_vpc" {
  cidr_block       = "10.20.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name        = "glb-vpc"
    Environment = "standard"
    workspace   = "${terraform.workspace}"
  }
}

#Adding backend for statefile
terraform {
  backend "s3" {
    bucket = "aws-infra-glb-config"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
