
variable "environment" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}
variable "instance_profile" {
  description = "IAM instance profile for the EC2 instance"
  type        = string
}
