output "bucket_name" {
  value = [for name in aws_s3_bucket.example : name.bucket]
}
