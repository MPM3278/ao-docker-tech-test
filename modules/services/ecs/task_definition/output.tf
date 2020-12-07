output "task_definition_id" {
    description = "Task Definition ID"
    value = "${aws_ecs_task_definition.task_definition.id}"
}
output "task_definiton_arn" {
    description = "Task Definition ARN"
    value = "${aws_ecs_task_definition.task_definition.arn}"
}