
variable "environement" {
  type = number
}

variable "s3_buckets" {
  type = list(any)
}

variable "s3_base_object" {}

variable "sg_name" {}

variable "org-name" {}

variable "region" {}
