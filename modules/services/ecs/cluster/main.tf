resource "aws_ecs_cluster" "ecs_cluster" {
    name               = var.name
    capacity_providers = var.capacity_providers

    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}