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


resource "aws_s3_bucket" "example" {
  for_each = var.s3_buckets
  bucket   = "wired-marmoset-${each.value}"
}

resource "aws_s3_object" "object" {
  for_each = var.s3_buckets
  bucket   = aws_s3_bucket.example[each.key].id
  key      = var.s3_base_object
}
