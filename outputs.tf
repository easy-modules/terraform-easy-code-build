output "aws_cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.app[*].arn
}

output "codebuild_project_arn" {
  description = "The ARN of the CodeBuild project"
  value       = aws_codebuild_project.codebuild[*].arn
}

output "codebuild_project_id" {
  description = "The ID of the CodeBuild project"
  value       = aws_codebuild_project.codebuild[*].id
}

output "codebuild_project_name" {
  description = "The name of the CodeBuild project"
  value       = aws_codebuild_project.codebuild[*].name
}

output "codebuild_project_tags" {
  description = "The ARN of the CodeBuild project's"
  value       = aws_codebuild_project.codebuild[*].tags
}
