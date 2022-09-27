# SSH public key
resource "aws_key_pair" "ssh_public_key" {
  key_name   = "ubuntu"
  public_key = var.ssh_public_key
}
