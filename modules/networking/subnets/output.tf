output "subnet_id" {
    description = "Subnet ID"
    value = "${aws_subnet.subnet.id}"
}
output "subnet_arn" {
    description = "Subnet ARN"
    value = "${aws_subnet.subnet.arn}"
}
