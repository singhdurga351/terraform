resource "aws_key_pair" "deployer" {
  key_name   = var.key
  public_key = "#create ssh-keygen in local machin and paste the pub key here"
}
