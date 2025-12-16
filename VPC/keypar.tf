# Generate a secure private key in memory
resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

# Create the key pair in AWS using the public key from above.
resource "aws_key_pair" "generated_key_pair" {
  key_name   = "${var.project_name}-Key"
  public_key = tls_private_key.generated_key.private_key_openssh
}

#Save the private Key to a local file.
resource "local_file" "private_key_pem" {
  content         = tls_private_key.generated_key.private_key_pem
  filename        = "${path.module}/my-key.pem"
  file_permission = "0400"
}
