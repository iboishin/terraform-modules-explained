##################################################
############## Raw Data Lambda Role ##############
##################################################
resource "aws_iam_role" "iam_for_lambda_dash_raw" {
  name = "${var.project-name}-${var.env}-raw-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# S3 permissions for lambda function + glue crawler
resource "aws_iam_policy" "iam_for_lambda_dash_raw" {
  name = "${var.project-name}-${var.env}-raw-lambda-policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::mb-analytics-db-exports",
        "arn:aws:s3:::mb-analytics-db-exports/*"
      ]
    },
    {
      "Action": [
        "glue:StartCrawler"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::mb-analytics-db-raw",
        "arn:aws:s3:::mb-analytics-db-raw/*"
      ]
    }
  ]
}
EOF
}

# Needed for S3 access
resource "aws_iam_role_policy_attachment" "iam_for_lambda_s3_dash_raw" {
  role       = aws_iam_role.iam_for_lambda_dash_raw.name
  policy_arn = aws_iam_policy.iam_for_lambda_dash_raw.arn
}

# # Needed to publish on SNS
# resource "aws_iam_role_policy_attachment" "iam_for_lambda_sns_dash_raw" {
#   role       = aws_iam_role.iam_for_lambda_dash_raw.name
#   policy_arn = aws_iam_policy.iam_for_lambda_dash_sns.arn
# }

# # Needed for logs
# resource "aws_iam_role_policy_attachment" "iam_for_lambda_dash_logs" {
#   role       = aws_iam_role.iam_for_lambda_dash_raw.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }