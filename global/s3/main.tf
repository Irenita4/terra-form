provider "aws" {
  region = "us-east-1"
}

terraform {
  backend s3  {
    bucket = "terra-forma-civir-irene"
    key = "global/s3/terraform_tfstate"
    region = "us-east-1"

    dynamodb_table = "terra-forma-civir-irene-lock"
    encrypt = true
  }  
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terra-forma-civir-irene"

  lifecycle {
    prevent_destroy = true 
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = "terra-forma-civir-irene-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}