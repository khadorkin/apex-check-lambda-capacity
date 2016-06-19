variable "aws_region" {}

variable "apex_function_check_lambda_capacity" {}

variable "email_address" {
  default = "knakayama.sh@gmail.com"
}

variable "display_name" {
  default = "[Alert] apex-check-lambda-capacity"
}

variable "owner" {
  default = "apex-check-lambda-capacity"
}

variable "stack_name" {
  default = "apex-check-lambda-capacity-sns-email"
}
