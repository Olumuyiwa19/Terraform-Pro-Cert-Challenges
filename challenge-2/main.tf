terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = var.environment
    }
  }
}

module "ec2" {
  source      = "./modules/ec2-module"
  environment = var.environment
}

module "iam" {
  source      = "./modules/iam-module"
  environment = var.environment
  org-name    = var.org-name
}

module "random" {
  source = "./modules/random-module"
}

module "sg" {
  source      = "./modules/sg-module"
  environment = var.environment
  sg_name     = var.sg_name
}

module "s3" {
  #for_each       = toset([var.s3_buckets])
  source         = "./modules/s3-module"
  s3_buckets     = ["var.s3_buckets"]
  s3_base_object = var.s3_base_object
  environment    = var.environment
}
