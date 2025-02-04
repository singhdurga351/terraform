# Step: Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "my_private_bucket_versioning" {
  bucket = "my-terrabucket" #Create S3 bucket first either from console or terraform code

  versioning_configuration {
    status = "Enabled"
  }
}

