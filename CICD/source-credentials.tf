### GitHub Credentials of Auth ###


resource "aws_codebuild_source_credential" "github-mpm3278" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = "977e2918ad414c9976466121b3ddfc66b6eacf22"
}



#### Please note these have now been deactivated for security ####