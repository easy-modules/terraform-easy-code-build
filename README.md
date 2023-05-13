# Terraform easy modules

Terraform module to deploy Codebuild

## Usage

```hcl
  codepipeline_enabled           = false
  cloudwatch_logs_enabled        = true
  source_type                    = "GITHUB"
  stage                          = "dev"
  type_project                   = "easy_modules"
  build_timeout                  = "20"
  queue_timeout                  = "10"
  buildspec_path                 = "buildspec.yaml"
  source_credentials_server_type = "GITHUB"
  repository_url                 = "https://github.com/easy-modules/terraform-easy-code-build.git"
  environment_type               = "LINUX_CONTAINER"
  environment_privileged_mode    = false
  environment_compute_type       = "BUILD_GENERAL1_SMALL"
  
  tags = {
    "Environment" = "dev"
  }
    
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.app](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_codebuild_project.codebuild](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/codebuild_project) | resource |
| [aws_codebuild_source_credential.source_credential](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/codebuild_source_credential) | resource |
| [aws_iam_role.assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/iam_role_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codebuild_policy_document](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_build_timeout"></a> [build\_timeout](#input\_build\_timeout) | (optional) value of the build timeout | `string` | `"20"` | no |
| <a name="input_buildspec_path"></a> [buildspec\_path](#input\_buildspec\_path) | (required) value of the buildspec path | `string` | `""` | no |
| <a name="input_cloudwatch_logs_enabled"></a> [cloudwatch\_logs\_enabled](#input\_cloudwatch\_logs\_enabled) | (optional) value of the cloudwatch logs | `bool` | `false` | no |
| <a name="input_codepipeline_enabled"></a> [codepipeline\_enabled](#input\_codepipeline\_enabled) | (optional) value of the codepipeline enabled | `bool` | `false` | no |
| <a name="input_environment_compute_type"></a> [environment\_compute\_type](#input\_environment\_compute\_type) | (optional) value of the environment compute type | `string` | `"BUILD_GENERAL1_SMALL"` | no |
| <a name="input_environment_image"></a> [environment\_image](#input\_environment\_image) | (optional) value of the environment image | `string` | `"aws/codebuild/amazonlinux2-x86_64-standard:4.0"` | no |
| <a name="input_environment_image_pull_credentials_type"></a> [environment\_image\_pull\_credentials\_type](#input\_environment\_image\_pull\_credentials\_type) | (optional) value of the environment image pull credentials type | `string` | `"CODEBUILD"` | no |
| <a name="input_environment_privileged_mode"></a> [environment\_privileged\_mode](#input\_environment\_privileged\_mode) | (optional) value of the environment privileged mode | `bool` | `"true"` | no |
| <a name="input_environment_type"></a> [environment\_type](#input\_environment\_type) | (optional) value of the environment type | `string` | `"LINUX_CONTAINER"` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | (optional) value of the environment variable | `map(string)` | <pre>{<br>  "TERRAFORM": "true"<br>}</pre> | no |
| <a name="input_git_clone_depth"></a> [git\_clone\_depth](#input\_git\_clone\_depth) | (optional) value of the git clone depth | `number` | `1` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | (optional) value of the arn | `string` | `""` | no |
| <a name="input_queue_timeout"></a> [queue\_timeout](#input\_queue\_timeout) | (optional) value of the queue timeout | `string` | `"10"` | no |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | (optional) value of the repository name | `string` | `"https://github.com/easy-modules/terraform-easy-code-build.git"` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | (optional) value of the retention in days | `number` | `30` | no |
| <a name="input_source_credentials_auth_type"></a> [source\_credentials\_auth\_type](#input\_source\_credentials\_auth\_type) | (optional) value of the auth type | `string` | `"PERSONAL_ACCESS_TOKEN"` | no |
| <a name="input_source_credentials_server_type"></a> [source\_credentials\_server\_type](#input\_source\_credentials\_server\_type) | (optional) value of the server type | `string` | `"GITHUB"` | no |
| <a name="input_source_credentials_token"></a> [source\_credentials\_token](#input\_source\_credentials\_token) | (optional) set token if source\_type is different of 'NO\_SOURCE' | `string` | `"your-token-here"` | no |
| <a name="input_source_type"></a> [source\_type](#input\_source\_type) | (optional) value of the source type - CODEPIPELINE \|\| GITHUB \|\| BITBUCKET \|\| S3 \|\| NO\_SOURCE | `string` | `"GITHUB"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | (optional) DEV \|\| PROD \|\| TEST | `string` | `"dev"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (optional) tags for the resources | `map(string)` | `{}` | no |
| <a name="input_type_project"></a> [type\_project](#input\_type\_project) | (optional) value of the project | `string` | `"demo"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_cloudwatch_log_group_arn"></a> [aws\_cloudwatch\_log\_group\_arn](#output\_aws\_cloudwatch\_log\_group\_arn) | The ARN of the CloudWatch log group |
| <a name="output_codebuild_project_arn"></a> [codebuild\_project\_arn](#output\_codebuild\_project\_arn) | The ARN of the CodeBuild project |
| <a name="output_codebuild_project_id"></a> [codebuild\_project\_id](#output\_codebuild\_project\_id) | The ID of the CodeBuild project |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
