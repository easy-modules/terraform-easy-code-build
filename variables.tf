variable "service_role" {
  type        = string
  description = "The ARN of the IAM role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account."
}

variable "name" {
  type        = string
  description = "Codebuild Name to be used on all the resources as identifier"
  default     = ""
}

variable "codebuild_tags" {
  type        = map(string)
  description = "Additional tags for the CodeBuild project"
  default     = {}
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev'"
  default     = "default"
}

variable "type_project" {
  type        = string
  description = "Type of project, e.g. 'app', 'infra', 'data', 'ml'"
  default     = "demo"
}

variable "build_timeout" {
  type        = string
  description = "The number of minutes a build is allowed to be queued before it times out."
  default     = "20"
}

variable "queued_timeout" {
  type        = string
  description = "The number of minutes a queue is allowed to be queued before it times out."
  default     = "10"
}


variable "resource_access_role" {
  type        = string
  description = "The ARN of the IAM role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account."
  default     = ""
}

variable "artifacts_type" {
  type        = string
  description = "The type of build output artifact. Valid values are: CODEPIPELINE, NO_ARTIFACTS, S3"
  default     = "NO_ARTIFACTS"
}

variable "cache_type" {
  type        = string
  description = "The type of cache used by the build project. Valid values are: LOCAL, NO_CACHE, S3"
  default     = "LOCAL"
}

variable "cache_modes" {
  type        = list(string)
  description = "A list of cache modes. Valid values are: LOCAL_DOCKER_LAYER_CACHE, LOCAL_SOURCE_CACHE, LOCAL_CUSTOM_CACHE"
  default     = ["LOCAL_SOURCE_CACHE"]
}

variable "environment_image" {
  type        = string
  description = "The image tag or image digest that identifies the Docker image to use for this build project. Use the following formats: For an image tag: registry/repository:tag. For an image digest: registry/repository@digest. The Docker image used for your AWS CodeBuild build project must be in the same AWS Region as the build project. Additionally, you must use the full registry and repository URI. For example, you must use registry.hub.docker.com/library/ubuntu instead of ubuntu."
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
}

variable "environment_type" {
  type        = string
  description = "The type of build environment to use for related builds. Valid values are: ARM_CONTAINER, LINUX_CONTAINER, LINUX_GPU_CONTAINER, WINDOWS_CONTAINER, WINDOWS_SERVER_2019_CONTAINER"
  default     = "LINUX_CONTAINER"
}

variable "environment_image_pull_credentials_type" {
  type        = string
  description = "The type of credentials AWS CodeBuild uses to pull images in your build. Valid values are: CODEBUILD, SERVICE_ROLE"
  default     = "CODEBUILD"
}

variable "environment_compute_type" {
  type        = string
  description = "The type of compute environment to use for the build project. Valid values are: BUILD_GENERAL1_SMALL, BUILD_GENERAL1_MEDIUM, BUILD_GENERAL1_LARGE"
  default     = "BUILD_GENERAL1_SMALL"
}

variable "environment_privileged_mode" {
  type        = bool
  description = "Enable this flag to run the Docker daemon inside a Docker container. This value must be set to true only if the build project is used to build Docker images, and the specified build environment image is not one provided by AWS CodeBuild with Docker support. Otherwise, all associated builds that attempt to interact with the Docker daemon will fail."
  default     = true
}

variable "environment_certificate" {
  type        = string
  description = "The ARN of the AWS Certificate Manager (ACM) certificate for the build project. Only valid when using an HTTPS or SSH connection type."
  default     = null
}

variable "registry_credential" {
  type        = map(any)
  description = "A map of registry credential objects that contain credentials for access to a private registry. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project#registry_credential"
  default     = {}
}

variable "environment_variables" {
  type        = map(string)
  description = "A map of environment variable objects that are available to builds for this build project. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project#environment_variable"
  default     = {}
}

variable "source_type" {
  type        = string
  description = "The type of repository that contains the source code to be built. Valid values are: CODECOMMIT, CODEPIPELINE, GITHUB, GITHUB_ENTERPRISE, NO_SOURCE, S3, BITBUCKET, GITHUB_ENTERPRISE_SERVER"
  default     = "GITHUB"
}

variable "source_git_clone_depth" {
  type        = number
  description = "The Git clone depth for the build project. Valid values are: 0 to 3000"
  default     = 1
}

variable "source_location" {
  type        = string
  description = "Information about the location of the source code to be built."
}

variable "source_buildspec" {
  type        = string
  description = "The contents of a buildspec file. This value overrides a buildspec file created with the source_version or source_identifier parameter. For more information, see Buildspec File Name and Storage Location."
}

variable "git_submodules_config_fetch_submodules" {
  type        = bool
  description = "Set to true to fetch Git submodules for your AWS CodeBuild build project."
  default     = true
}

variable "logs_config_cloudwatch_logs" {
  type        = map(any)
  description = "Information about Amazon CloudWatch Logs for a build project. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project#cloudwatch_logs"
  default     = {}
}




