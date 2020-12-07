### GitHub Credentials of Auth ###


resource "aws_codebuild_source_credential" "github-mpm3278" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = "f635950f3d9a64198c3967cf9864e525ea2785dc"
}



#### Please note these have now been deactivated for security ####