locals {
  webhook_secret = "super-secret"
}

## AWS Pipeline Webhook

resource "aws_codepipeline_webhook" "ao-webhook" {
  name            = "ao-mm-webhook"
  authentication  = "GITHUB_HMAC"
  target_action   = "Source"
  target_pipeline = "${aws_codepipeline.codepipeline.name}"

  authentication_configuration {
    secret_token = local.webhook_secret
  }

  filter {
    json_path    = "$.ref"
    match_equals = "refs/heads/{Branch}"
  }
}

# Wire the CodePipeline webhook into a GitHub repository.
resource "github_repository_webhook" "ao-gh-webook" {
  repository = "https://github.com/MPM3278/ao-docker-tech-test/"


  name = "web"

  configuration {
    url          = "${aws_codepipeline_webhook.ao-webhook.url}"
    content_type = "json"
    insecure_ssl = true
    secret       = local.webhook_secret
  }

  events = ["push"]
}