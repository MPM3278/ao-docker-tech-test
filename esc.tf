### ECS ###

module "ecs_cluster" {
    source                = "./modules/services/ecs/cluster"
    name                  = "ao-mm-cluster"
    default_tags          = var.default_tags
    capacity_providers    = ["ao-mm-capacityprovider"]
}

module "ecs_capacity_provider" {
    source                = "./modules/services/ecs/capacity_provider"
    name                  = "ao-mm-capacityprovider"
    default_tags          = var.default_tags
    asg_arn               = module.ecs_autoscaling.asg_arn

}

module "ecs_task_definition" {
    source                = "./modules/services/ecs/task_definition"
    name                  = "ao-mm-td"
    default_tags          = var.default_tags
    family                = "ao-mm-nginx-ao"
    execution_role_arn    = "${aws_iam_role.ao_mm_task_role.arn}"
    container_definitions = file("container-definitions/container-def.json")
}

module "ecs_service_nginx" {
    source                ="./modules/services/ecs/ecs_service"
    name                  = "ao-mm-ecs-nginx"
    default_tags          = var.default_tags
    cluster               = module.ecs_cluster.cluster_arn
    task_definition_arn   = module.ecs_task_definition.task_definiton_arn
    desired_count         = 2
    target_group_arn      = module.target_group.target_group_arn
    container_name        = "nginx"
    container_port        = 80
    }



    
