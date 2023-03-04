output "aws_codebuild_project_name" {
  value       = aws_codebuild_project.this.name
  description = "value of the name attribute of the aws_codebuild_project resource"
}

output "aws_codebuild_project_arn" {
  value       = aws_codebuild_project.this.arn
  description = "value of the arn attribute of the aws_codebuild_project resource"
}

output "aws_codebuild_project_id" {
  value       =  aws_codebuild_project.this.id
  description = "value of the id attribute of the aws_codebuild_project resource"
}
