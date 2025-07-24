########Provider Declaration 
provider "aws" {
  region = var.region
}

####local tags
locals {
  tags = {
    terraform   = "yes"
    Env         = "prod"
  }
}
######provisioning S3 bucket
resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name

  tags = local.tags
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_sate_encryption" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

/*
############### provisioning DynamDB tabel for state lock
Using Dynamodb for state lock has been depreciated
resource "aws_dynamodb_table" "tf_lock" {
  name           = var.Dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
    tags = local.tags
}
*/