output "lb_listener_id" {
    description = "LB Listener ID"
    value = "${aws_lb_listener.http_alb_listener.id}"
}
output "lb_listener_arn" {
    description = "LB Listener ARN"
    value = "${aws_lb_listener.http_alb_listener.arn}"
}

