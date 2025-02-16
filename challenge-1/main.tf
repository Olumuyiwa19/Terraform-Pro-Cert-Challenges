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

resource "random_pet" "this" {}

resource "aws_iam_user" "lb" {
  count = 3
  name  = "${random_pet.this.id}-${var.org-name}-${count.index}"
}

####### Import block for the IAM users ##########
import {
  to = aws_iam_user.lb[0]
  id = "open-flounder-muyicom-0"
}
import {
  to = aws_iam_user.lb[1]
  id = "open-flounder-muyicom-1"
}
import {
  to = aws_iam_user.lb[2]
  id = "open-flounder-muyicom-2"
}

# This policy must be associated with all IAM users created through this code.

resource "aws_iam_user_policy" "lb_ro" {
  count = 3
  name  = "ec2-describe-policy"
  user  = aws_iam_user.lb[count.index].name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

####### Import block for the IAM users policy ##########
import {
  to = aws_iam_user_policy.lb_ro[0]
  id = "open-flounder-muyicom-0:ec2-describe-policy"
}

import {
  to = aws_iam_user_policy.lb_ro[1]
  id = "open-flounder-muyicom-1:ec2-describe-policy"
}

import {
  to = aws_iam_user_policy.lb_ro[2]
  id = "open-flounder-muyicom-2:ec2-describe-policy"
}


resource "aws_s3_bucket" "muyi_bucket" {
  for_each = var.s3_buckets
  bucket   = "${random_pet.this.id}-${each.key}"
}


resource "aws_s3_object" "object" {
  for_each = var.s3_buckets
  bucket   = aws_s3_bucket.muyi_bucket[each.key].id
  key      = var.s3_base_object
}


####### Import block for the S3 buckets #########
import {
  to = aws_s3_bucket.muyi_bucket["muyilabs-2025-1"]
  id = "open-flounder-muyilabs-2025-1"
}


import {
  to = aws_s3_bucket.muyi_bucket["muyilabs-2025-2"]
  id = "open-flounder-muyilabs-2025-2"
}

####### Import block for the S3 objects #########
import {
  to = aws_s3_object.object["muyilabs-2025-1"]
  id = "s3://open-flounder-muyilabs-2025-1/base.txt"
}

import {
  to = aws_s3_object.object["muyilabs-2025-2"]
  id = "s3://open-flounder-muyilabs-2025-2/base.txt"
}

####### Import block for the Security group ########

import {
  to = aws_security_group.muyilabs-sg
  id = "sg-01f49ec71d6575056"
}

import {
  to = aws_vpc_security_group_ingress_rule.muyilabs-sg-rule
  id = "sgr-0403fe605839adee2"
}
