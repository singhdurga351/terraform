resource "aws_security_group" "my_sg" {
  name        = "test-sg"
  description = "test-sg"

  // Example inbound rule allowing SSH (port 22) from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere
  }

  // Example outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Optional: Enable logging or additional security group settings
  tags = {
    Name = "test-sg"
  }
}
