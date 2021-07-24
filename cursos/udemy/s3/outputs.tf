output "bucket" {
  value = aws_s3_bucket.bucket.id
}

output "objects" {
  value = aws_s3_bucket_object.object.*.key
}