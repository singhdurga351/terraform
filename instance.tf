
resource "aws_instance" "test_ec2" {

  ami           = var.AMI[var.region]
  instance_type = "t2.micro" # Choose an appropriate instance type

  # Key pair for SSH access
  key_name = aws_key_pair.deployer.key_name # Replace with your key pair name

  # Security group association (assuming you have created an SG already)
  security_groups = [aws_security_group.my_sg.name] # Ensure 'my_sg' exists


  # Add tags to your EC2 instance

  tags = {
    Name    = "Web-instance"
    Project = "Test"
  }
  # Optional: Create a public IP (if launching in a public subnet)
  associate_public_ip_address = true
  # Provisioners to copy and execute the shell script
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh", # Make the script executable
      "sudo /tmp/web.sh"      # Run the script with sudo
    ]
  }

  # Connection block for SSH
  connection {
    type        = "ssh"
    user        = var.user         # Assuming var.user is defined elsewhere
    private_key = file("test-key") # Path to your private key
    host        = self.public_ip   # The public IP of the instance
  }
}

resource "aws_ec2_instance_state" "test" {
  instance_id = aws_instance.test_ec2.id
  state       = "running"
}

# Provisioners to copy and execute the shell script

# Example of an output to show EC2 instance details after creation
output "instance_id" {
  value = aws_instance.test_ec2.id
}

output "public_ip" {
  value = aws_instance.test_ec2.public_ip
}



