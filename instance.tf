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

  owners = ["099720109477"] # Canonical

}

resource "aws_instance" "test_ec2" {

  ami           = data.aws_ami.ubuntu.id # Replace with your AMI ID
  instance_type = "t2.micro"             # Choose an appropriate instance type

  # Key pair for SSH access
  key_name = aws_key_pair.deployer.key_name # Replace with your key pair name

  # Security group association (assuming you have created an SG already)
  security_groups = [aws_security_group.my_sg.name] # Ensure 'my_sg' exists


  # Add tags to your EC2 instance

  tags = {
    Name    = "Test-Instance"
    Project = "Test"
  }
  # Optional: Create a public IP (if launching in a public subnet)
  associate_public_ip_address = true

  # Optional: Shutdown behavior (stop or terminate on shutdown)
}

resource "aws_ec2_instance_state" "test" {
  instance_id = aws_instance.test_ec2.id
  state       = "running"
}

# Example of an output to show EC2 instance details after creation
output "instance_id" {
  value = aws_instance.test_ec2.id
}

output "public_ip" {
  value = aws_instance.test_ec2.public_ip
}


