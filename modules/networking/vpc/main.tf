resource "aws_vpc" "vpc_main" {
    cidr_block          = var.vpc_cidr
    instance_tenancy    = "default"
    enable_dns_hostnames = true
    
    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
    
}