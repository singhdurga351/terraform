resource "aws_key_pair" "deployer" {
  key_name   = var.key
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA0NiHILmr2GBvRbH9HTpSxUbISOjAIT3bDoe6kXNUtw AzureAD+DurgaPrasadSingh@RCCHN0322"
}
