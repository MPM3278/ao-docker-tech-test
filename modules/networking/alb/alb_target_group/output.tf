output "target_group_id" {
    description = "Target Group ID"
    value = "${aws_lb_target_group.http_lb_target_group.id}"
}

output "target_group_arn" {
    description = "Target Group ARN"
    value = "${aws_lb_target_group.http_lb_target_group.arn}"
}