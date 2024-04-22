## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.budget_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.budget_resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_sns_topic.account_billing_alarm_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.account_billing_alarm_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.account_billing_updates_sqs_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_iam_policy_document.sns_topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_budget_limit"></a> [account\_budget\_limit](#input\_account\_budget\_limit) | Account budget limit to be spent | `number` | n/a | yes |
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | Account name where budget is being deployed | `string` | n/a | yes |
| <a name="input_budget_account_threshold"></a> [budget\_account\_threshold](#input\_budget\_account\_threshold) | Threshold set for account budget alarm | `number` | n/a | yes |
| <a name="input_budget_resources_threshold"></a> [budget\_resources\_threshold](#input\_budget\_resources\_threshold) | Threshold set for resources budget alarm | `number` | n/a | yes |
| <a name="input_email_addresses"></a> [email\_addresses](#input\_email\_addresses) | List of email addresses of the subscriber email notifications | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Default AWS region | `string` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | List of AWS services to be monitored in terms of costs | <pre>map(object({<br>    budget_limit = string<br>  }))</pre> | n/a | yes |
| <a name="input_sns_endpoint_email"></a> [sns\_endpoint\_email](#input\_sns\_endpoint\_email) | The email address of sns endpoint | `string` | n/a | yes |

## Outputs

No outputs.
