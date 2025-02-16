#!/bin/bash

# Output S3 bucket names to s3.txt
terraform output -json s3_bucket > s3.txt

# Output IAM user names to iam-users.txt
terraform output -json user_name > iam-users.txt

# Output Security Group ID to sg-combined.txt
terraform output -json sg_id > sg-combined.txt

# Output Security Group Rule ID to sg-combined.txt
terraform output -json sg_rule_id >> sg-combined.txt