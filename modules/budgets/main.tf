resource "aws_sns_topic" "account_billing_alarm_topic" {
  name = "account-billing-alarm-topic-${var.account_name}"
  display_name = "account-billing-alarm-topic-${var.account_name}"
}

resource "aws_sns_topic_subscription" "account_billing_updates_sqs_target" {
  topic_arn = aws_sns_topic.account_billing_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.sns_endpoint_email
}

resource "aws_sns_topic_policy" "account_billing_alarm_policy" {
  arn    = aws_sns_topic.account_billing_alarm_topic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {

  statement {
    sid = "AWSBudgetsSNSPublishingPermissions"
    effect = "Allow"

    actions = [
      "SNS:Receive",
      "SNS:Publish"
    ]

    principals {
      type        = "Service"
      identifiers = ["budgets.amazonaws.com"]
    }

    resources = [
      aws_sns_topic.account_billing_alarm_topic.arn
    ]
  }
}

resource "aws_budgets_budget" "budget_account" {
  name              = "Monthly Account Budget - ${var.account_name}"
  budget_type       = "COST"
  limit_amount      = var.account_budget_limit
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2024-01-01_00:00"

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = var.budget_account_threshold
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = [                  # Must use subscriber_email_addresses or subscriber_sns_topic_arns
      aws_sns_topic.account_billing_alarm_topic.arn
    ]
    subscriber_email_addresses = [for email in local.subscriber_email_addresses : email]

  }

  depends_on = [
    aws_sns_topic.account_billing_alarm_topic
  ]
}

resource "aws_budgets_budget" "budget_resources" {
  for_each = var.services

  name              = "${each.key} - Monthly Resource Budget - ${var.account_name} "
  budget_type       = "COST"
  limit_amount      = each.value.budget_limit
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2023-01-01_00:00"
  
  cost_filter {
    name   = "Service"
    values = [lookup(local.aws_services, each.key)]
  }


  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = var.budget_resources_threshold
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = [                  # Must use subscriber_email_addresses or subscriber_sns_topic_arns
      aws_sns_topic.account_billing_alarm_topic.arn
    ]
    subscriber_email_addresses = [for email in local.subscriber_email_addresses : email]
  }

  depends_on = [
    aws_sns_topic.account_billing_alarm_topic
  ]
}