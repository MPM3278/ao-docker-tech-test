#Creates Security Group in the shared VPC

resource "aws_security_group" "sg" {
  description = "Private SG"
  vpc_id      = var.vpc_id

  # Allow outbound internet access.
  egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
  }

# Allow all inbound traffic.
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    security_groups = [(var.public_sg)]
  }

# Allow all inbound traffic.
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["192.168.3.0/24"]
  }

  # Allow all inbound traffic.
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["192.168.4.0/24"]
  }

  # Allow all inbound traffic.
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["192.168.5.0/24"]
  }


tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
        
 }
