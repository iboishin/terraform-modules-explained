variable "project-name" {
  type    = string
  default = "analytics-dashboard"
}

variable "env" {
  type        = string
  description = "Type of environment"
  default     = "dev"

  # validation {
  #   condition     = regex("dev|preprod|prod", var.env)
  #   error_message = "Please specify one of the following : dev, preprod, prod"
  # }
}

variable "lambda-role-arn" {
  type        = string
  description = "IAM role used for lambda execution"
}

variable "function-name" {
  type        = string
  description = "Name for lambda function"
}

variable "lambda-code-path" {
  type        = string
  description = "Location of code for lambda function"
}

variable "lambda-zip-path" {
  type        = string
  description = "Location of zip file for lambda function"
}
