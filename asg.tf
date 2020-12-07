### Launch Template ###


data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami*amazon-ecs-optimized"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon", "self"]
}

module "ecs_launch_config" {
    source               = "./modules/services/auto_scaling/launch_config"
    name                 = "ao-mm-launchconfig"
    image_id             = data.aws_ami.amazon_linux.id
    instance_type        = "t3.small"
    key_name             = "ao-mm-key"
    iam_instance_profile = aws_iam_instance_profile.ao_mm_ecs_service_role.name
    user_data            = file("./config/user_data.sh")
    default_tags         = var.default_tags
    security_groups      = [module.private_sg.sg_id]
}


### ASG ###

module "ecs_autoscaling" {
    source              = "./modules/services/auto_scaling/asg"
    name                = "ao-mm-asg"
    max_size            = 2
    min_size            = 1
    desired_capacity    = 2
    launch_configuration_name  = module.ecs_launch_config.launch_config_id
    vpc_zone_identifier = [module.ao_prvsubnet1.subnet_id, module.ao_prvsubnet2.subnet_id, module.ao_prvsubnet3.subnet_id]
    target_group_arns   = module.target_group.target_group_arn
}
