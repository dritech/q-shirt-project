# EC2 Instance for Mapping Augmented Reality to NFT
resource "aws_instance" "ar_nft_mapping_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.web.id]

  tags = {
    Name = "ar-nft-mapping-instance"
  }

  # Sample provisioner for installing Java and connecting to AuroraDB (adjust as needed)
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y java-1.8.0-openjdk",
      # Example: Install MySQL client for AuroraDB
      "sudo yum install -y mysql",
      # Example: Configure application with AuroraDB credentials
      "echo 'export DB_HOST=<AuroraDB endpoint>' >> ~/.bashrc"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")  # Replace with your SSH private key path
    }
  }
}