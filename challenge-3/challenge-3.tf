terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

module "asg" {
  source = "./asg"
  providers = {
    aws = aws.asg
  }
}

module "iam" {
  source = "./iam"
  providers = {
    aws = aws.iam
  }
}
data "aws_caller_identity" "local" {
  provider = aws.local
}

resource "local_file" "aws_account" {
  content  = data.aws_caller_identity.local.account_id
  filename = "${path.module}/account_details.txt"
}
