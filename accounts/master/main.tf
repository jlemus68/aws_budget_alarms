# Backend

# terraform {
#  backend "s3" {
#    bucket         = "my-terraform-backend-s3" # This is the name backend s3 bucket configured
#    key            = "state/terraform.my-budget-alarms-backend" 
#    region         = "us-east-1"
#    encrypt        = true
#    kms_key_id     = "alias/terraform-bucket-key"
#    dynamodb_table = "terraform-state"
#  }
# }
