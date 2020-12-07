resource "aws_ecs_task_definition" "task_definition" {
    family                =  var.family
    container_definitions = var.container_definitions
    network_mode          = "bridge"
    execution_role_arn    = var.execution_role_arn

    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}


