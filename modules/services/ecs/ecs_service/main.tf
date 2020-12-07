resource "aws_ecs_service" "ecs_service" {
    name            = var.name
    cluster         = var.cluster
    task_definition = var.task_definition_arn
    desired_count   = var.desired_count
    iam_role        = "arn:aws:iam::057276272747:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"

    load_balancer {
        target_group_arn = var.target_group_arn
        container_name   = var.container_name
        container_port   = var.container_port
  }

    tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}