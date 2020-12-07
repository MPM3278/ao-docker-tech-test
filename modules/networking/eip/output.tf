output "eip_id" {
    description = "EIP ID"
    value = "${aws_eip.nat_eip.id}"
}