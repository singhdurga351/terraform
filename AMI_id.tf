provider "aws" {
  region = "us-east-2"  # Ensure the region is set to us-east-2
}

# Fetch the most recent Ubuntu AMI for Ubuntu 22.04 in the specified region (us-east-2)
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical (Owner ID for Ubuntu images)
}

# Output the AMI ID to verify it's correctly selected
output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}
