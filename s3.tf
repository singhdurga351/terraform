
# Step 1: Create the private S3 bucket
resource "aws_s3_bucket" "my_private_bucket" {
  bucket = "my-terrabucket" #this is globally unique
  acl    = "private"        # Ensure the bucket is private

  tags = {
    Name        = "My bucket"
    Environment = "Test"
  }
}


#: Output the bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.my_private_bucket.bucket
}
