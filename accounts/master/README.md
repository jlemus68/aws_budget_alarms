## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.45.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_billing_alarm"></a> [billing\_alarm](#module\_billing\_alarm) | ../../modules/budgets | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_budget_limit"></a> [account\_budget\_limit](#input\_account\_budget\_limit) | Account budget limit to be spent | `number` | `30` | no |
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | Account name | `string` | `"Master"` | no |
| <a name="input_budget_account_threshold"></a> [budget\_account\_threshold](#input\_budget\_account\_threshold) | Threshold set for account budget alarm | `number` | `85` | no |
| <a name="input_budget_resources_threshold"></a> [budget\_resources\_threshold](#input\_budget\_resources\_threshold) | Threshold set for resources budget alarm | `number` | `80` | no |
| <a name="input_email_addresses"></a> [email\_addresses](#input\_email\_addresses) | List of email addresses of the users | `list(string)` | <pre>[<br>  "email@gmail.com"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Default AWS region | `string` | `"us-east-1"` | no |
| <a name="input_sns_endpoint_email"></a> [sns\_endpoint\_email](#input\_sns\_endpoint\_email) | The email address of sns endpoint | `string` | `"email@gmail.com"` | no |

## Outputs

No outputs.
