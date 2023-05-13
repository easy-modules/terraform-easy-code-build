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
