output "capacity_provider_id" {
    description = "Capacity Provider ID"
    value = "${aws_ecs_capacity_provider.capacity_provider.id}"
}
output "capacity_provider_arn" {
    description = "Capacity Provider ARN"
    value = "${aws_ecs_capacity_provider.capacity_provider.arn}"
}