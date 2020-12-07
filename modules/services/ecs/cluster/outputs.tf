output "cluster_id" {
    description = "ECS Cluster ID"
    value = "${aws_ecs_cluster.ecs_cluster.id}"
}
output "cluster_arn" {
    description = "ECS Cluster ARN"
    value = "${aws_ecs_cluster.ecs_cluster.arn}"
}