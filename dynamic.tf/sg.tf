resource "aws_security_group" "allow_ports" {
  name        = "allow_ports"
  description = "allowing 22,80,8080,3306 ports"

  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port   = ingress.value["port"] #each.value[<key-name>]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name      = "aws_security"
    CreatedBy = "Praveen"
  }
}


