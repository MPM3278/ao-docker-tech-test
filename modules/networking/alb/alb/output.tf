output "lb_id" {
    description = "LB ID"
    value = "${aws_lb.alb.id}"
}
output "lb_arn" {
    description = "LB ARN"
    value = "${aws_lb.alb.arn}"
}

