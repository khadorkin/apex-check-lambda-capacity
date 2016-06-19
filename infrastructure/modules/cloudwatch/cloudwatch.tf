resource "aws_cloudwatch_event_rule" "lambda" {
  name                = "apex-check-lambda-capacity"
  description         = "apex check lambda capacity"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "lambda" {
  rule      = "${aws_cloudwatch_event_rule.lambda.name}"
  target_id = "apex-check-lambda-capacity"
  arn       = "${var.apex_function_check_lambda_capacity}"
}

resource "aws_lambda_permission" "lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_cloudwatch_event_target.lambda.arn}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.lambda.arn}"
}

resource "aws_cloudwatch_metric_alarm" "lambda" {
  alarm_name          = "apex-check-lambda-capacity"
  alarm_description   = "Lambda capacity usage alert"
  namespace           = "lambda"
  metric_name         = "size"
  statistic           = "Average"
  period              = "300"
  unit                = "Bytes"
  evaluation_periods  = "2"
  threshold           = "${var.threshold}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_actions       = ["${var.sns_email_topic_arn}"]
}
