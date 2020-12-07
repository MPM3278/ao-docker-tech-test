resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  availability_zone = var.az
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = true


    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}
