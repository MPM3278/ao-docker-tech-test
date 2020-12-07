terraform {
  backend "s3" {
    bucket = "alexanderbuttychops"
    key    = "./terraform.tfstate"
    region = "eu-west-2"
  }
}