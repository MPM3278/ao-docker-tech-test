output "sg_id" {
    description = "Public SG ID"
    value = "${aws_security_group.sg.id}"
}
