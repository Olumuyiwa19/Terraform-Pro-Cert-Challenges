output "s3_bucket" {
  value = [for name in aws_s3_bucket.muyi_bucket : name.bucket]
}

output "user_name" {
  value = aws_iam_user.lb[*].name

}
/*
output "sg_id" {
  value = aws_security_group.muyi_sg.id
}

output "sg_rule_id" {
  value = aws_vpc_security_group_ingress_rule.muyi_sg_rule.id
}
*/
