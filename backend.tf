resource "aws_s3_bucket" "tfstate-ym-bucket" {
  bucket = "tfstate-ym-bucket"
}

resource "aws_s3_bucket_ownership_controls" "tfstate-ym-bucket_ownership" {
  bucket = aws_s3_bucket.tfstate-ym-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "stfstate-ym-bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.tfstate-ym-bucket_ownership]
  bucket     = aws_s3_bucket.tfstate-ym-bucket.id
  acl        = "private"
}

resource "aws_s3_bucket_versioning" "tfstate-ym-bucket_versioning" {
  bucket = aws_s3_bucket.tfstate-ym-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate-ym-bucket_sse" {
  bucket = aws_s3_bucket.tfstate-ym-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      # kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  #   provider = aws.gritworks-master
  name         = "terraform_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}