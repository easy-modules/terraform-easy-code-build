## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.57.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifacts_type"></a> [artifacts\_type](#input\_artifacts\_type) | The type of build output artifact. Valid values are: CODEPIPELINE, NO\_ARTIFACTS, S3 | `string` | `"NO_ARTIFACTS"` | no |
| <a name="input_build_timeout"></a> [build\_timeout](#input\_build\_timeout) | The number of minutes a build is allowed to be queued before it times out. | `string` | `"20"` | no |
| <a name="input_cache_modes"></a> [cache\_modes](#input\_cache\_modes) | A list of cache modes. Valid values are: LOCAL\_DOCKER\_LAYER\_CACHE, LOCAL\_SOURCE\_CACHE, LOCAL\_CUSTOM\_CACHE | `list(string)` | <pre>[<br>  "LOCAL_SOURCE_CACHE"<br>]</pre> | no |
| <a name="input_cache_type"></a> [cache\_type](#input\_cache\_type) | The type of cache used by the build project. Valid values are: LOCAL, NO\_CACHE, S3 | `string` | `"LOCAL"` | no |
| <a name="input_codebuild_tags"></a> [codebuild\_tags](#input\_codebuild\_tags) | Additional tags for the CodeBuild project | `map(string)` | `{}` | no |
| <a name="input_environment_certificate"></a> [environment\_certificate](#input\_environment\_certificate) | The ARN of the AWS Certificate Manager certificate for the build project. Only valid when using an HTTPS or SSH connection type. | `string` | `null` | no |
| <a name="input_environment_compute_type"></a> [environment\_compute\_type](#input\_environment\_compute\_type) | The type of compute environment to use for the build project. Valid values are: BUILD\_GENERAL1\_SMALL, BUILD\_GENERAL1\_MEDIUM, BUILD\_GENERAL1\_LARGE | `string` | `"BUILD_GENERAL1_SMALL"` | no |
| <a name="input_environment_image"></a> [environment\_image](#input\_environment\_image) | The image tag or image digest that identifies the Docker image to use for this build project. Use the following formats: For an image tag: registry/repository:tag. For an image digest: registry/repository@digest. The Docker image used for your AWS CodeBuild build project must be in the same AWS Region as the build project. Additionally, you must use the full registry and repository URI. For example, you must use registry.hub.docker.com/library/ubuntu instead of ubuntu. | `string` | `"aws/codebuild/amazonlinux2-x86_64-standard:4.0"` | no |
| <a name="input_environment_image_pull_credentials_type"></a> [environment\_image\_pull\_credentials\_type](#input\_environment\_image\_pull\_credentials\_type) | The type of credentials AWS CodeBuild uses to pull images in your build. Valid values are: CODEBUILD, SERVICE\_ROLE | `string` | `"CODEBUILD"` | no |
| <a name="input_environment_privileged_mode"></a> [environment\_privileged\_mode](#input\_environment\_privileged\_mode) | Enable this flag to run the Docker daemon inside a Docker container. This value must be set to true only if the build project is used to build Docker images, and the specified build environment image is not one provided by AWS CodeBuild with Docker support. Otherwise, all associated builds that attempt to interact with the Docker daemon will fail. | `bool` | `true` | no |
| <a name="input_environment_type"></a> [environment\_type](#input\_environment\_type) | The type of build environment to use for related builds. Valid values are: ARM\_CONTAINER, LINUX\_CONTAINER, LINUX\_GPU\_CONTAINER, WINDOWS\_CONTAINER, WINDOWS\_SERVER\_2019\_CONTAINER | `string` | `"LINUX_CONTAINER"` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | A map of environment variable objects that are available to builds for this build project. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project#environment_variable | `map(string)` | `{}` | no |
| <a name="input_git_submodules_config_fetch_submodules"></a> [git\_submodules\_config\_fetch\_submodules](#input\_git\_submodules\_config\_fetch\_submodules) | Set to true to fetch Git submodules for your AWS CodeBuild build project. | `bool` | `true` | no |
| <a name="input_logs_config_cloudwatch_logs"></a> [logs\_config\_cloudwatch\_logs](#input\_logs\_config\_cloudwatch\_logs) | Information about Amazon CloudWatch Logs for a build project. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project#cloudwatch_logs | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Codebuild Name to be used on all the resources as identifier | `string` | `""` | no |
| <a name="input_queued_timeout"></a> [queued\_timeout](#input\_queued\_timeout) | The number of minutes a queue is allowed to be queued before it times out. | `string` | `"10"` | no |
| <a name="input_registry_credential"></a> [registry\_credential](#input\_registry\_credential) | A map of registry credential objects that contain credentials for access to a private registry. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project#registry_credential | `map(any)` | `{}` | no |
| <a name="input_resource_access_role"></a> [resource\_access\_role](#input\_resource\_access\_role) | The ARN of the IAM role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account. | `string` | `""` | no |
| <a name="input_service_role"></a> [service\_role](#input\_service\_role) | The ARN of the IAM role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account. | `string` | n/a | yes |
| <a name="input_source_buildspec"></a> [source\_buildspec](#input\_source\_buildspec) | The contents of a buildspec file. This value overrides a buildspec file created with the source\_version or source\_identifier parameter. For more information, see Buildspec File Name and Storage Location. | `string` | n/a | yes |
| <a name="input_source_git_clone_depth"></a> [source\_git\_clone\_depth](#input\_source\_git\_clone\_depth) | The Git clone depth for the build project. Valid values are: 0 to 3000 | `number` | `1` | no |
| <a name="input_source_location"></a> [source\_location](#input\_source\_location) | Information about the location of the source code to be built. | `string` | n/a | yes |
| <a name="input_source_type"></a> [source\_type](#input\_source\_type) | The type of repository that contains the source code to be built. Valid values are: CODECOMMIT, CODEPIPELINE, GITHUB, GITHUB\_ENTERPRISE, NO\_SOURCE, S3, BITBUCKET, GITHUB\_ENTERPRISE\_SERVER | `string` | `"GITHUB"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev' | `string` | `"default"` | no |
| <a name="input_type_project"></a> [type\_project](#input\_type\_project) | Type of project, e.g. 'app', 'infra', 'data', 'ml' | `string` | `"demo"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_codebuild_project_arn"></a> [aws\_codebuild\_project\_arn](#output\_aws\_codebuild\_project\_arn) | value of the arn attribute of the aws\_codebuild\_project resource |
| <a name="output_aws_codebuild_project_id"></a> [aws\_codebuild\_project\_id](#output\_aws\_codebuild\_project\_id) | value of the id attribute of the aws\_codebuild\_project resource |
| <a name="output_aws_codebuild_project_name"></a> [aws\_codebuild\_project\_name](#output\_aws\_codebuild\_project\_name) | value of the name attribute of the aws\_codebuild\_project resource |
