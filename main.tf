resource "aws_codebuild_project" "this" {
  name = join("-", tolist([
    var.name,
    var.type_project,
    var.stage,
  ]))


  description          = format("codebuild for %s project", var.type_project)
  build_timeout        = var.build_timeout
  queued_timeout       = var.queued_timeout
  service_role         = var.service_role
  resource_access_role = try(var.resource_access_role, null)

  artifacts {
    type = var.artifacts_type
  }

  cache {
    type  = var.cache_type
    modes = var.cache_modes
  }

  environment {
    image                       = var.environment_image
    type                        = var.environment_type
    image_pull_credentials_type = var.environment_image_pull_credentials_type
    privileged_mode             = var.environment_privileged_mode
    compute_type                = var.environment_compute_type
    certificate                 = var.environment_certificate

    dynamic "registry_credential" {
      for_each = try(var.registry_credential, {})
      content {
        credential_provider = registry_credential.value.credential_provider
        credential          = registry_credential.value.credential
      }
    }

    dynamic "environment_variable" {
      for_each = try(var.environment_variables, {})
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  source {
    type            = var.source_type
    git_clone_depth = var.source_git_clone_depth
    location        = var.source_location
    buildspec       = sensitive(try(var.source_buildspec, null))
    git_submodules_config {
      fetch_submodules = var.git_submodules_config_fetch_submodules
    }
  }

  dynamic "logs_config" {
    for_each = try(var.logs_config_cloudwatch_logs, {})
    content {
      cloudwatch_logs {
        status     = logs_config.value.cw_log_group.status
        group_name = logs_config.value.cw_log_group.name
      }
    }
  }

  tags = merge(
    { "Name" = var.name },
    var.codebuild_tags,
  )
}
