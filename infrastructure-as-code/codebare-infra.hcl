# EC2 Instance for Assigning Code Bares
resource "aws_instance" "code_bares_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.web.id]

  tags = {
    Name = "code-bares-instance"
  }

  # Sample provisioner for installing Java (adjust as needed)
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y java-1.8.0-openjdk"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")  # Replace with your SSH private key path
    }
  }
}