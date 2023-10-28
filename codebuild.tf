# aws_codebuild_project.first-flask:
resource "aws_codebuild_project" "first-flask" {
    badge_enabled          = false
    build_timeout          = 60
    concurrent_build_limit = 1
    encryption_key         = "arn:aws:kms:ap-northeast-1:914281350488:alias/aws/s3"
    name                   = "first-flask"
    project_visibility     = "PRIVATE"
    queued_timeout         = 480
    service_role           = "arn:aws:iam::914281350488:role/service-role/codebuild-first-flask-service-role"
    tags                   = {}
    tags_all               = {}

    artifacts {
        encryption_disabled    = false
        name                   = "first-flask"
        override_artifact_name = false
        packaging              = "NONE"
        type                   = "CODEPIPELINE"
    }

    cache {
        modes = []
        type  = "NO_CACHE"
    }

    environment {
        compute_type                = "BUILD_GENERAL1_SMALL"
        image                       = "aws/codebuild/standard:7.0"
        image_pull_credentials_type = "CODEBUILD"
        privileged_mode             = true
        type                        = "LINUX_CONTAINER"
    }

    logs_config {
        cloudwatch_logs {
            status = "ENABLED"
        }

        s3_logs {
            encryption_disabled = false
            status              = "DISABLED"
        }
    }

    source {
        git_clone_depth     = 0
        insecure_ssl        = false
        report_build_status = false
        type                = "CODEPIPELINE"
    }
}
