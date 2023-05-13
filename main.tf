locals {
  has_source_code = var.source_type != "NO_SOURCE" ? true : false
  has_logs        = var.cloudwatch_logs_enabled ? true : false
  has_iam_role    = var.iam_role_arn != "" ? true : false
  repository_name = split(".", split("/", var.repository_url)[4])[0]

}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_iam_policy_document" "codebuild_policy_document" {
  count = local.has_iam_role ? 0 : 1
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "s3:*",
    ]

    resources = ["*"]
  }
}
data "aws_iam_policy_document" "assume_role" {
  count = local.has_iam_role ? 0 : 1
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "assume_role" {
  count              = local.has_iam_role ? 0 : 1
  name               = "${var.stage}-${var.type_project}-${local.repository_name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role[count.index].json
}

resource "aws_iam_role_policy" "iam_role_policy" {
  count  = local.has_iam_role ? 0 : 1
  role   = aws_iam_role.assume_role[count.index].name
  policy = data.aws_iam_policy_document.codebuild_policy_document[count.index].json
}

resource "aws_codebuild_project" "codebuild" {
  name                 = format("%s-codebuild", local.repository_name)
  description          = "AWS CodeBuild for the app ${var.type_project}"
  build_timeout        = var.build_timeout
  queued_timeout       = var.queue_timeout
  service_role         = local.has_iam_role ? var.iam_role_arn : aws_iam_role.assume_role[0].arn
  resource_access_role = local.has_iam_role ? var.iam_role_arn : aws_iam_role.assume_role[0].arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type  = "LOCAL"
    modes = ["LOCAL_SOURCE_CACHE"]
  }

  environment {
    image                       = var.environment_image
    type                        = var.environment_type
    image_pull_credentials_type = var.environment_image_pull_credentials_type
    privileged_mode             = var.environment_privileged_mode
    compute_type                = var.environment_compute_type

    dynamic "environment_variable" {
      for_each = try(var.environment_variables, {})
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
    environment_variable {
      name  = "STAGE"
      value = var.stage
    }
    environment_variable {
      name  = "AWS_REGION"
      value = data.aws_region.current.name
    }
    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = data.aws_caller_identity.current.id
    }
  }

  source {
    type            = var.source_type
    git_clone_depth = var.git_clone_depth
    location        = local.has_source_code ? var.repository_url : null # "https://github.com/${var.organization}/${var.repository_name}.git"
    buildspec       = local.has_source_code ? null : try(file(var.buildspec_path), null)
    git_submodules_config {
      fetch_submodules = true
    }
  }

  dynamic "logs_config" {
    for_each = local.has_logs ? [1] : []
    content {
      cloudwatch_logs {
        status      = "ENABLED"
        group_name  = aws_cloudwatch_log_group.app[0].name
        stream_name = aws_cloudwatch_log_group.app[0].name
      }
    }
  }
  tags = merge({ CreatedBy = "Terraform" }, var.tags)
}

resource "aws_cloudwatch_log_group" "app" {
  count             = local.has_logs ? 1 : 0
  name              = "codebuild/${var.stage}/${local.repository_name}"
  retention_in_days = var.retention_in_days
  tags              = merge({ CreatedBy = "Terraform" }, var.tags)
}

resource "aws_codebuild_source_credential" "source_credential" {
  count       = var.codepipeline_enabled == false && local.has_source_code ? 1 : 0
  auth_type   = var.source_credentials_auth_type
  server_type = var.source_credentials_server_type
  token       = var.source_credentials_token
}
