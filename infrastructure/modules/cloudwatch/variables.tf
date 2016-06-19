variable "apex_function_check_lambda_capacity" {}

variable "lambda_function_role_id" {}

variable "sns_email_topic_arn" {}

variable "threshold" {
  default = "100000000"
}
