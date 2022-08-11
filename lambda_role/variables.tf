variable "project-name" {
  type    = string
  default = "analytics-dashboard"
}

variable "env" {
  type        = string
  description = "Type of environment"
  default = "dev"

  # validation {
  #   condition     = regex("dev|preprod|prod", var.env)
  #   error_message = "Please specify one of the following : dev, preprod, prod"
  # }
}