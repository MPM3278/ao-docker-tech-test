provider "aws" {
    version   = "~> 2.7"
    region    = var.region  
}

resource "aws_ecr_repository" "ao-mm-repo" {
  name                 = "ao-mm-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}