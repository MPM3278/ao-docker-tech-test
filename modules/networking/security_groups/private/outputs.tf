output "sg_id" {
    description = "Private SG ID"
    value = "${aws_security_group.sg.id}"
}

