
locals {
  csv_data = csvdecode(file("${path.module}/ec2.csv"))
  us_ec2   = [for ec2 in local.csv_data : ec2 if ec2.Region == "us-east-1"]
  instance_type_mapping = {
    "micro" = "t2.micro"
    "nano"  = "t3.nano"
  }
}

/*
output "csv_data" {
  value = local.us_ec2
}
*/


resource "aws_instance" "ec2" {
  count = length(local.us_ec2)

  ami           = local.us_ec2[count.index]["AMI_ID"]
  instance_type = local.instance_type_mapping[local.us_ec2[count.index].instance_type]
  tags = {
    Name = local.us_ec2[count.index]["Team_Name"]
  }
}
