output "lambda-role-arn" {
  value       = aws_iam_role.iam_for_lambda_dash_raw.arn
  description = "IAM role used for lambda execution"
}