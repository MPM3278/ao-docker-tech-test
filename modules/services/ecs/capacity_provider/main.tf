resource "aws_ecs_capacity_provider" "capacity_provider" {
    name = var.name
    auto_scaling_group_provider {
        auto_scaling_group_arn          = var.asg_arn
    }

    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}