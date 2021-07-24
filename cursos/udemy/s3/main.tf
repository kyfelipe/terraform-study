resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  acl    = var.acl
  tags   = var.tags

  versioning {
    enabled = var.versioning
  }
}

resource "aws_s3_bucket_object" "object" {
  count  = var.create_object ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  key    = var.object_key
  source = var.object_source
  etag   = filemd5(var.object_source)
}
