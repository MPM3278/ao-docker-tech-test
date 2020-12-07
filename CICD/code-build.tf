### Code Build ###

resource "aws_codebuild_project" "ao-mm-codebuild-aoapp" {
    name                  = "ao-mm-codebuild-aoapp"
    description           = "AO - Matthew Marshall - Technical Assessment"
    build_timeout         = 300
    queued_timeout        = 480
    service_role          = "${aws_iam_role.codebuild_role.arn}"


    source {
        buildspec           = "${file("./buildspec.yml")}"
        type                = "GITHUB"
        location            = "https://github.com/MPM3278/ao-docker-tech-test.git"
    }

    environment {
        compute_type                = "BUILD_GENERAL1_SMALL"
        image                       = "aws/codebuild/amazonlinux2-x86_64-standard:2.0"
        image_pull_credentials_type = "CODEBUILD"
        privileged_mode             = true
        type                        = "LINUX_CONTAINER"
  }

    artifacts {
        type = "NO_ARTIFACTS"
  }
}

