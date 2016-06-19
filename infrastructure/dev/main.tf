module "iam" {
  source = "../modules/iam"
}

module "sns_email_topic" {
  source = "github.com/deanwilson/tf_sns_email"

  display_name  = "${var.display_name}"
  email_address = "${var.email_address}"
  owner         = "${var.owner}"
  stack_name    = "${var.stack_name}"
}

module "cloudwatch" {
  source = "../modules/cloudwatch"

  apex_function_check_lambda_capacity = "${var.apex_function_check_lambda_capacity}"
  lambda_function_role_id             = "${module.iam.lambda_function_role_id}"
  sns_email_topic_arn                 = "${module.sns_email_topic.arn}"
}
