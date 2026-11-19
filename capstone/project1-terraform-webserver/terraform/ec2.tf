resource "aws_instance" "web" {
  ami                         = "ami-0f58b397bc5c1f2e8"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0391feeb69966b00f"
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF2
#!/bin/bash
apt-get update -y
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2
echo "<h1>Project 1 Terraform Web Server - Amrish Yadav</h1>" > /var/www/html/index.html
EOF2

  tags = {
    Name = "Amrish_terraform-webserver"
  }
}
