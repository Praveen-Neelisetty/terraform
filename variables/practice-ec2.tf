
resource "aws_instance" "db_ec2_Instance" {
  ami                    = var.ami_image_id
  vpc_security_group_ids = [aws_security_group.allow_ssh_practice.id]
  instance_type          = var.instance_type

  tags = var.instance_tags
}

resource "aws_security_group" "allow_ssh_practice" {
  name        = "Allowing SSH"
  description = "Allowing SSH ports"

  ingress {
    from_port   = var.from_port_inbounce
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cibr_blocks
  }

  tags = {
    name      = "security_group"
    createdBy = "Prakash"
  }
}

