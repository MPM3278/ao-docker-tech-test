resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gw_id
  }

    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}
