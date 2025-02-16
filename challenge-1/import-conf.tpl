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