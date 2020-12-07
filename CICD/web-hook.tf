resource "aws_codebuild_webhook" "ao-webhook" {
  project_name = "${aws_codebuild_project.ao-mm-codebuild-aoapp.name}"

  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }

    filter {
      type    = "HEAD_REF"
      pattern = "master"
    }
  }
}