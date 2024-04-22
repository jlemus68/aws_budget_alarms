variable "account_name" {
  description = "Account name where budget is being deployed"
  type        = string
}

variable "account_budget_limit" {
  description = "Account budget limit to be spent"
  type        = number
}

variable "budget_account_threshold" {
    description = "Threshold set for account budget alarm"
    type = number
}

variable "budget_resources_threshold" {
    description = "Threshold set for resources budget alarm"
    type = number
}

variable "services" {
  description = "List of AWS services to be monitored in terms of costs"

  type = map(object({
    budget_limit = string
  }))
}

variable "region" {
  description = "Default AWS region"
  type = string
}

variable "sns_endpoint_email" {
  description = "The email address of sns endpoint"
  type        = string
  
  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.sns_endpoint_email))
    error_message = "Invalid email format. Please provide a valid email addresses."
  }
}

variable "email_addresses" {
  description = "List of email addresses of the subscriber email notifications"
  type        = list(string)
  
  validation {
    condition = can(alltrue([for email in var.email_addresses : can(regex("^\\S+@\\S+\\.\\S+$", email))]))
    error_message = "Invalid email format. Please provide valid email addresses."
  }
}