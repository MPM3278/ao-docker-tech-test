resource "aws_lb_target_group" "http_lb_target_group" {
    name                    = var.name
    target_type             = "instance"
    port                    = 80
    protocol                = "HTTP"
    vpc_id                  = var.vpc_id

    health_check {
        path                = "/"
        healthy_threshold   = 2
        unhealthy_threshold = 10
        timeout             = 60
        interval            = 300
        matcher             = "200,301,302"
  }

        tags = merge(map( 
            "Name", var.name, 
        ), var.default_tags)
}