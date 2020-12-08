terraform {
  backend "s3" {
    bucket = "XXXX"
    key    = "./terraform.tfstate"
    region = "eu-west-2"
  }
}