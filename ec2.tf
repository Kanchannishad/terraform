resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key-pair"
  public_key = file("${path.module}/terraform-key.pub")
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "twssecurity" {
  name        = "allow-ports"
  description = "Open ports for EC2 instance"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0f5fcdfbd140e4ab7" # Ubuntu AMI (us-east-2)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.twssecurity.name]

  tags = {
    Name = "MyTerraformInstance"
  }
}
