resource "aws_launch_configuration" "launch_config" {
    image_id             = var.image_id
    instance_type        = var.instance_type
    security_groups      = var.security_groups
    key_name             = var.key_name
    iam_instance_profile = var.iam_instance_profile
    name                 = var.name
  
    lifecycle {
         create_before_destroy = true
  }

    user_data = var.user_data

}