# Backend configuration for storing Terraform state
terraform {
  backend "s3" {
    bucket = "my-terrabucket" #Create S3 bucket first either from console or terraform code
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
