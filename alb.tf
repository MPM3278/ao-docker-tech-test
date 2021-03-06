### ALB ###

module "alb" {
    source                = "./modules/networking/alb/alb"
    name                  = "ao-mm-alb"
    internal              = false
    subnets               = [module.ao_pubsubnet1.subnet_id, module.ao_pubsubnet2.subnet_id]
    security_groups       = module.public_sg.sg_id
    default_tags          = var.default_tags

}

module "target_group" {
    source                = "./modules/networking/alb/alb_target_group"
    name                  = "ao-mm-targetgroup"
    default_tags          = var.default_tags
    vpc_id                = module.VPC.vpc_id
}

module "alb_listener" {
    source                = "./modules/networking/alb/alb_listener"
    name                  = "ao-mm-alblistener"
    default_tags          = var.default_tags
    port                  = 80
    protocol              = "HTTP"
    load_balancer_arn     = module.alb.lb_arn
    target_group_arn      = module.target_group.target_group_arn

}

