resource "aws_nat_gateway" "nat_gw" {
    allocation_id = var.eip_id
    subnet_id     = var.pub_subnet_id

    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}

