output "vpc_id" {
    description = "VPC ID"
    value = "${aws_vpc.vpc_main.id}"
}
output "vpc_arn" {
    description = "VPC ARN"
    value = "${aws_vpc.vpc_main.arn}"
}

output "vpc_cidr" {
    description = "VPC CIDR"
    value = "${aws_vpc.vpc_main.cidr_block}"
}