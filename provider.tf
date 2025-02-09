provider "aws" {
  region     = var.region # Update with your desired region
  access_key = var.access #better to launch an ec2 amd attach IAM to ec2 with adminfullAccess
  secret_key = var.secret #or install aws cli in same terraform machine and store creds in .aws folder
}
