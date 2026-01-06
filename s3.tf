provider "aws" {
  region = "us-east-2"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "kanchan-terraform-${random_id.bucket_id.hex}"

  tags = {
    Name = "kanchan-terraform-bucket"
  }
}

