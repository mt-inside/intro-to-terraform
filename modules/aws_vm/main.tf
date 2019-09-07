data "aws_ami" "ubuntu" {
  owners = ["099720109477"] # Cannonical

  filter {
    name = "name"
    # Ubuntu image names have a long path prefix; most don't
    values = ["*ubuntu-bionic-18.04-*"]
  }

  filter {
    name   = "ena-support"
    values = ["true"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  most_recent = true
}

resource "aws_instance" "main" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = var.name
  }

  vpc_security_group_ids = [aws_security_group.main.id]

  user_data = templatefile("${path.module}/provisioners/cloud-config.yaml", {})
}

resource "aws_security_group" "main" {
  name = var.name

  tags = {
    Name = var.name
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
