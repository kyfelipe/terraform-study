provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "us-east-2"
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_instance" "dev" {
  count                  = 3
  ami                    = "ami-04b9e92b5572fa0d1"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.access-ssh.id}"]
  
  tags = {
    Name = "dev${count.index}"
  }
}

/*
resource "aws_instance" "dev4" {
  ami                    = "${var.amis["us-east-1"]}"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.access-ssh.id}"]
  depends_on             = [aws_s3_bucket.dev4]

  tags = {
    Name = "dev4"
  }
}
*/

resource "aws_instance" "dev5" {
  ami                    = "${var.amis["us-east-1"]}"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.access-ssh.id}"]

  tags = {
    Name = "dev5"
  }
}

resource "aws_instance" "dev6" {
  provider               = aws.us-east-2
  ami                    = "${var.amis["us-east-2"]}"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.access-ssh-us2.id}"]
  depends_on             = [aws_dynamodb_table.dynamodb-hml]

  tags = {
    Name = "dev6"
  }
}

resource "aws_instance" "dev7" {
  provider               = aws.us-east-2
  ami                    = "${var.amis["us-east-2"]}"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.access-ssh-us2.id}"]

  tags = {
    Name = "dev7"
  }
}

/*
resource "aws_s3_bucket" "dev4" {
  bucket = "felipe-dev4"
  acl    = "private"

  tags = {
    Name = "felipe-dev4"
  }
}
*/

resource "aws_dynamodb_table" "dynamodb-hml" {
  provider     = aws.us-east-2
  name         = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key    = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}
