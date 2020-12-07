resource "aws_codebuild_webhook" "ao_webhook" {
  project_name = "${aws_codebuild_project.ao-mm-codebuild-aoapp.name}"

}

resource "github_repository_webhook" "ao_github_webhook" {
  active     = true
  events     = ["push"]
  repository = "https://github.com/MPM3278/ao-docker-tech-test/"

  configuration {
    url          = "${aws_codebuild_webhook.ao_webhook.payload_url}"
    secret       = "${aws_codebuild_webhook.ao_webhook.secret}"
    content_type = "json"
    insecure_ssl = false
  }
}