output "nat_gw_id" {
    description = "NAT GW ID"
    value = "${aws_nat_gateway.nat_gw.id}"
}

output "nat_gw_prv_ip" {
    description = "NAT GW ID"
    value = "${aws_nat_gateway.nat_gw.private_ip}"
}