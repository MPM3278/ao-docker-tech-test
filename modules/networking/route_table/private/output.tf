output "route_table_id" {
    description = "Route Table ID"
    value = "${aws_route_table.private_route_table.id}"
}