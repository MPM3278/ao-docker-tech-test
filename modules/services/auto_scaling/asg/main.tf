resource "aws_autoscaling_group" "asg" {
    name                      = var.name
    max_size                  = var.max_size
    min_size                  = var.min_size
    desired_capacity          = var.desired_capacity
    health_check_grace_period = 300
    health_check_type         = "ELB"
    force_delete              = true
    launch_configuration      = var.launch_configuration_name
    vpc_zone_identifier       = var.vpc_zone_identifier 
    target_group_arns         = [var.target_group_arns]

}