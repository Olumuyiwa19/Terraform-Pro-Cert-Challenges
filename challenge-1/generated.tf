# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sgr-0403fe605839adee2"
resource "aws_vpc_security_group_ingress_rule" "muyilabs-sg-rule" {
  cidr_ipv4                    = "10.0.0.0/8"
  cidr_ipv6                    = null
  description                  = null
  from_port                    = 80
  ip_protocol                  = "tcp"
  prefix_list_id               = null
  referenced_security_group_id = null
  security_group_id            = "sg-01f49ec71d6575056"
  tags                         = null
  to_port                      = 80
}

# __generated__ by Terraform from "sg-01f49ec71d6575056"
resource "aws_security_group" "muyilabs-sg" {
  description = "Managed by Terraform"
  egress      = []
  ingress = [{
    cidr_blocks      = ["10.0.0.0/8"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "muyilabs-sg"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all = {
    Environment = "prod"
  }
  vpc_id = "vpc-dd4c9ba0"
}
