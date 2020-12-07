resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }


    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}

