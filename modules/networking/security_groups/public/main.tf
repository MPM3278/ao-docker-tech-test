#Creates Security Group in the shared VPC

resource "aws_security_group" "sg" {
  description = "Public SG"
  vpc_id      = var.vpc_id

  # Allow outbound internet access.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Allow inbound SSH to Bastion Host.
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
        
 }
