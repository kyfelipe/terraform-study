provider "aws" {
  region  = var.region
  version = "~> 2.0"
}

resource "random_id" "random_value" {
  byte_length = 8
}


module "bucket" {
  source     = "./s3"
  name       = "my-bucket-${random_id.random_value.hex}"
  versioning = true

  tags = {
    "Name" = "bucket-test"
  }

  create_object = true
  object_key    = "files/${random_id.random_value.dec}.txt"
  object_source = "example.txt"
}

# resource "aws_s3_bucket" "bucket1" {
#   bucket = "tf-test-bucket-udemy"
#   acl    = "private"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_object" "object1" {
#   bucket = aws_s3_bucket.bucket1.id
#   key    = "hello-world.txt"
#   source = "./example.txt"
#   etag = filemd5("./example.txt")
# }

# output "bucket" {
#   value = aws_s3_bucket.bucket1.id
# }

