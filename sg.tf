### Security Groups ###

module "public_sg" {
    source                = "./modules/networking/security_groups/public"
    name                  = "ao-mm-pubsg" 
    vpc_id                = module.VPC.vpc_id
    default_tags          = var.default_tags
    
}

module "private_sg" {
    source                = "./modules/networking/security_groups/private"
    name                  = "ao-mm-prvsg" 
    vpc_id                = module.VPC.vpc_id
    default_tags          = var.default_tags
    public_sg             = module.public_sg.sg_id
    
}