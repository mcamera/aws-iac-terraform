# Creates a S3 bucket on AWS

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.base_bucket_name}-${var.environment}-${var.account_number}"
  tags = {
    IAC = "TERRAFORM"
  }
}

resource "aws_s3_bucket_acl" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Creates a S3 object on AWS

resource "aws_s3_object" "python_code" {
  bucket = aws_s3_bucket.bucket.id
  key    = "code/hello_world.py"
  acl    = "private"
  source = "../code/hello_world.py"
  etag   = filemd5("../code/hello_world.py")
}
