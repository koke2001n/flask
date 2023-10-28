# aws_codepipeline.first_flask_pipeline:
resource "aws_codepipeline" "first_flask_pipeline" {
    name     = "first_flask_pipeline"
    role_arn = "arn:aws:iam::914281350488:role/service-role/AWSCodePipelineServiceRole-ap-northeast-1-first_flask_pipeline"


    artifact_store {
        location = "codepipeline-ap-northeast-1-223107101137"
        type     = "S3"
    }

    stage {
        name = "Source"

        action {
            category         = "Source"
            configuration    = {
                "BranchName"           = "main"
                "ConnectionArn"        = "arn:aws:codestar-connections:ap-northeast-1:914281350488:connection/48568108-afe5-41dc-a6fa-cceb8c80f7de"
                "DetectChanges"        = "true"
                "FullRepositoryId"     = "koke2001n/flask"
                "OutputArtifactFormat" = "CODE_ZIP"
            }
            input_artifacts  = []
            name             = "Source"
            namespace        = "SourceVariables"
            output_artifacts = [
                "SourceArtifact",
            ]
            owner            = "AWS"
            provider         = "CodeStarSourceConnection"
            region           = "ap-northeast-1"
            run_order        = 1
            version          = "1"
        }
    }
    stage {
        name = "Build"

        action {
            category         = "Build"
            configuration    = {
                "ProjectName" = "first-flask"
            }
            input_artifacts  = [
                "SourceArtifact",
            ]
            name             = "Build"
            namespace        = "BuildVariables"
            output_artifacts = [
                "BuildArtifact",
            ]
            owner            = "AWS"
            provider         = "CodeBuild"
            region           = "ap-northeast-1"
            run_order        = 1
            version          = "1"
        }
    }
    stage {
        name = "Deploy"

        action {
            category         = "Deploy"
            configuration    = {
                "ClusterName" = "terraform_cluster"
                "FileName"    = "imagedefinitions.json"
                "ServiceName" = "terraform_ecs"
            }
            input_artifacts  = [
                "BuildArtifact",
            ]
            name             = "Deploy"
            namespace        = "DeployVariables"
            output_artifacts = []
            owner            = "AWS"
            provider         = "ECS"
            region           = "ap-northeast-1"
            run_order        = 1
            version          = "1"
        }
    }
}



