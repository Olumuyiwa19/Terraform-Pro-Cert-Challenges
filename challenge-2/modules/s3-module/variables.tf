
variable "environment" {
  type = string
}

variable "s3_buckets" {
  type = set(string)
}

variable "s3_base_object" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}
