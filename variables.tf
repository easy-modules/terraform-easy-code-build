#==========================================================================
# CODEBUILD PROJECT
#==========================================================================
variable "source_type" {
  type        = string
  description = "(optional) value of the source type - CODEPIPELINE || GITHUB || BITBUCKET || S3 || NO_SOURCE"
  default     = "GITHUB"
}
variable "type_project" {
  type        = string
  description = "(optional) value of the project"
  default     = "demo"
}
variable "stage" {
  type        = string
  description = "(optional) DEV || PROD || TEST"
  default     = "dev"
}
variable "codepipeline_enabled" {
  type        = bool
  description = "(optional) value of the codepipeline enabled"
  default     = false
}
variable "iam_role_arn" {
  type        = string
  description = "(optional) value of the arn"
  default     = ""
}
variable "build_timeout" {
  type        = string
  description = "(optional) value of the build timeout"
  default     = "20"
}
variable "queue_timeout" {
  type        = string
  description = "(optional) value of the queue timeout"
  default     = "10"
}
variable "tags" {
  type        = map(string)
  description = "(optional) tags for the resources"
  default     = {}
}

#==========================================================================
# CODEBUILD SOURCE
#==========================================================================
variable "repository_url" {
  type        = string
  description = "(optional) value of the repository name"
  default     = "https://github.com/easy-modules/terraform-easy-code-build.git"
}
variable "git_clone_depth" {
  type        = number
  description = "(optional) value of the git clone depth"
  default     = 1
}
variable "buildspec_path" {
  type        = string
  description = "(required) value of the buildspec path"
  default     = ""
}
variable "environment_variables" {
  type        = map(string)
  description = "(optional) value of the environment variable"
  default = {
    "TERRAFORM" = "true"
  }
}

#==========================================================================
# CODEBUILD ENVIRONMENT
#==========================================================================
variable "environment_image" {
  type        = string
  description = "(optional) value of the environment image"
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
}
variable "environment_type" {
  type        = string
  description = "(optional) value of the environment type"
  default     = "LINUX_CONTAINER"
}
variable "environment_image_pull_credentials_type" {
  type        = string
  description = "(optional) value of the environment image pull credentials type"
  default     = "CODEBUILD"
}
variable "environment_privileged_mode" {
  type        = bool
  description = "(optional) value of the environment privileged mode"
  default     = "true"
}
variable "environment_compute_type" {
  type        = string
  description = "(optional) value of the environment compute type"
  default     = "BUILD_GENERAL1_SMALL"
}

#==========================================================================
# CODEBUILD SOURCE CREDENTIALS
#==========================================================================
variable "source_credentials_token" {
  type        = string
  description = "(optional) set token if source_type is different of 'NO_SOURCE'"
  default     = "your-token-here"
}
variable "source_credentials_auth_type" {
  type        = string
  description = "(optional) value of the auth type"
  default     = "PERSONAL_ACCESS_TOKEN"
}
variable "source_credentials_server_type" {
  type        = string
  description = "(optional) value of the server type"
  default     = "GITHUB"
}

#==========================================================================
# CLOUDWATCH LOGS
#==========================================================================
variable "cloudwatch_logs_enabled" {
  type        = bool
  description = "(optional) value of the cloudwatch logs"
  default     = false
}
variable "retention_in_days" {
  type        = number
  description = "(optional) value of the retention in days"
  default     = 30
}
