### VPC ###

module "VPC" {
    source                 = "./modules/networking/vpc"
    name                   = "ao-mm-poc"
    vpc_cidr               = var.vpc_cidr
    default_tags           = var.default_tags
}

### NACL ###

module "NACL" {
    source                 = "./modules/networking/nacl"
    name                   = "ao-mm-nacl"
    vpc_id                 = module.VPC.vpc_id
    default_tags           = var.default_tags 
}

### Subnets ###

module "ao_pubsubnet1" {
    source                 = "./modules/networking/subnets"
    name                   = "ao-mm-pubsubnet1"
    vpc_id                 = module.VPC.vpc_id
    az                     = "eu-west-2a"
    subnet_cidr            = "192.168.1.0/24"
    default_tags           = var.default_tags      
}

module "ao_pubsubnet2" {
    source                 = "./modules/networking/subnets"
    name                   = "ao-mm-pubsubnet2"
    vpc_id                 = module.VPC.vpc_id
    az                     = "eu-west-2b"
    subnet_cidr            = "192.168.2.0/24"
    default_tags           = var.default_tags      
}

module "ao_prvsubnet1" {
    source                 = "./modules/networking/subnets"
    name                   = "ao-mm-prvsubnet1"
    vpc_id                 = module.VPC.vpc_id
    az                     = "eu-west-2a"
    subnet_cidr            = "192.168.3.0/24"
    default_tags           = var.default_tags      
}

module "ao_prvsubnet2" {
    source                 = "./modules/networking/subnets"
    name                   = "ao-mm-prvsubnet2"
    vpc_id                 = module.VPC.vpc_id
    az                     = "eu-west-2b"
    subnet_cidr            = "192.168.4.0/24"
    default_tags           = var.default_tags      
}

module "ao_prvsubnet3" {
    source                 = "./modules/networking/subnets"
    name                   = "ao-mm-prvsubnet3"
    vpc_id                 = module.VPC.vpc_id
    az                     = "eu-west-2a"
    subnet_cidr            = "192.168.5.0/24"
    default_tags           = var.default_tags      
}




### IGW ###

module "IGW" {
    source                 = "./modules/networking/igw"
    name                   = "ao-mm-igw"
    vpc_id                 = module.VPC.vpc_id
    default_tags           = var.default_tags
}

### Elastic IP for NAT Gateway ###

module "EIP" {
    source                = "./modules/networking/eip"
    name                  = "ao-mm-eip"
    default_tags          = var.default_tags 

}

### NAT Gateway ###

module "NAT_Gateway" {
    source                = "./modules/networking/nat_gateway"
    name                  = "ao-mm-natgateway"
    eip_id                = module.EIP.eip_id
    pub_subnet_id         = module.ao_pubsubnet1.subnet_id
    default_tags          = var.default_tags
}

### Public Route Table ###

module "public_route_table" {
    source                 = "./modules/networking/route_table/public"
    name                   = "ao-mm-public_route_table"
    vpc_id                 = module.VPC.vpc_id
    igw_id                 = module.IGW.igw_id
    default_tags           = var.default_tags
}

### Public Route Table Association to Public Subnets ###

module "public_route_assoc-1" {
    source                 = "./modules/networking/route_table/association"
    route_table_id         = module.public_route_table.route_table_id
    subnet_id              = module.ao_pubsubnet1.subnet_id
}

module "public_route_assoc-2" {
    source                 = "./modules/networking/route_table/association"
    route_table_id         = module.public_route_table.route_table_id
    subnet_id              = module.ao_pubsubnet2.subnet_id
}


### Private Route Table ####

module "private_route_table" {
    source                 = "./modules/networking/route_table/private"
    name                   = "ao-mm-private_route_table"
    nat_gw_id              = module.NAT_Gateway.nat_gw_id
    vpc_id                 = module.VPC.vpc_id
    default_tags           = var.default_tags
}

### Private Route Table Association to Private Subnets ###

module "private_route_assoc1" {
    source                 = "./modules/networking/route_table/association"
    route_table_id         = module.private_route_table.route_table_id
    subnet_id              = module.ao_prvsubnet1.subnet_id
}

module "private_route_assoc2" {
    source                 = "./modules/networking/route_table/association"
    route_table_id         = module.private_route_table.route_table_id
    subnet_id              = module.ao_prvsubnet2.subnet_id
}

module "private_route_assoc3" {
    source                 = "./modules/networking/route_table/association"
    route_table_id         = module.private_route_table.route_table_id
    subnet_id              = module.ao_prvsubnet3.subnet_id
}

