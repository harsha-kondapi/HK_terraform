provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "hk-terrform-backend-s3-bucket"

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "hk-terraform-dynamodb-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "MyTable"
    Environment = "Dev"
  }
}
