output "launch_config_id" {
    description = "Launch Config ID"
    value = "${aws_launch_configuration.launch_config.id}"
}
output "launch_config_arn" {
    description = "Launch Config ARN"
    value = "${aws_launch_configuration.launch_config.arn}"
}