variable "account_name" {
  description = "Account name"
  type        = string
  default     = "Master"
}

variable "account_budget_limit" {
  description = "Account budget limit to be spent"
  type        = number
  default     = 30
}

variable "budget_account_threshold" {
  description = "Threshold set for account budget alarm"
  type        = number
  default     = 85
}

variable "budget_resources_threshold" {
  description = "Threshold set for resources budget alarm"
  type        = number
  default     = 80
}

variable "region" {
  description = "Default AWS region"
  type        = string
  default     = "us-east-1"
}

variable "sns_endpoint_email" {
  description = "The email address of sns endpoint"
  type        = string
  default     = "email@gmail.com"

  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.sns_endpoint_email))
    error_message = "Invalid email format. Please provide a valid email address."
  }
}

variable "email_addresses" {
  description = "List of email addresses of the users"
  type        = list(string)
  default = [
    "email@gmail.com"
  ]

  validation {
    condition     = can(alltrue([for email in var.email_addresses : can(regex("^\\S+@\\S+\\.\\S+$", email))]))
    error_message = "Invalid email format. Please provide valid email addresses."
  }
}
