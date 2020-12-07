### GitHub Credentials of Auth ###


resource "aws_codebuild_source_credential" "github-mpm3278" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = "XXXXXX"
}



#### Please note Token has been removed from hard for security ####