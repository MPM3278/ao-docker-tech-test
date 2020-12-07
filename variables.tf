### Default Variables ###

variable "region" {
    default = "eu-west-2"
}

variable "vpc_cidr" {
    default = "192.168.0.0/16"
}


# Default Tags

variable "default_tags" {
    type = map
    default = {
        owner: "AO"
        service: "ECS Task"
        created_by: "Matthew Marshall"
        environment: "dev"
    }
}