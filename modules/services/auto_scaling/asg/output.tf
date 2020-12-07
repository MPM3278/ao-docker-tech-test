output "asg_id" {
    description = "ASG ID"
    value = "${aws_autoscaling_group.asg.id}"
}
output "asg_arn" {
    description = "ASG ARN"
    value = "${aws_autoscaling_group.asg.arn}"
}
