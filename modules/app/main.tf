data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-app-sg"
  description = "Allow traffic from Web tier only"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [var.web_sg_id]  # Only Web SG can talk to App
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = var.key_name
  associate_public_ip_address = false

  # User-data to install NGINX and serve a simple page
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>App Server - ${var.project_name}</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.project_name}-app"
  }
}
