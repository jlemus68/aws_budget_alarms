module "billing_alarm" {
  source = "../../modules/budgets"

  region                     = var.region
  sns_endpoint_email         = var.sns_endpoint_email
  email_addresses            = var.email_addresses
  account_name               = var.account_name
  account_budget_limit       = var.account_budget_limit
  budget_account_threshold   = var.budget_account_threshold
  budget_resources_threshold = var.budget_resources_threshold

  services = {
    EC2 = {
      budget_limit = "10.0"
    },
    S3 = {
      budget_limit = "5.0"
    },
    RDS = {
      budget_limit = "5.0"
    },
    EBS = {
      budget_limit = "10.0"
    },
    Athena = {
      budget_limit = "5.0"
    },
    ECR = {
      budget_limit = "5.0"
    },
    ECS = {
      budget_limit = "5.0"
    },
    Kubernetes = {
      budget_limit = "5.0"
    },
    CloudFront = {
      budget_limit = "5.0"
    },
    CloudTrail = {
      budget_limit = "5.0"
    },
    CloudWatch = {
      budget_limit = "5.0"
    },
    CodeBuild = {
      budget_limit = "5.0"
    },
    Cognito = {
      budget_limit = "5.0"
    },
    Config = {
      budget_limit = "5.0"
    },
    DynamoDB = {
      budget_limit = "5.0"
    },
    DMS = {
      budget_limit = "5.0"
    },
    ElastiCache = {
      budget_limit = "5.0"
    },
    Elasticsearch = {
      budget_limit = "5.0"
    },
    ELB = {
      budget_limit = "5.0"
    },
    Gateway = {
      budget_limit = "5.0"
    },
    Glue = {
      budget_limit = "5.0"
    },
    Kafka = {
      budget_limit = "5.0"
    },
    KMS = {
      budget_limit = "5.0"
    },
    Kinesis = {
      budget_limit = "5.0"
    },
    Lambda = {
      budget_limit = "5.0"
    },
    Lex = {
      budget_limit = "5.0"
    },
    Matillion = {
      budget_limit = "5.0"
    },
    Pinpoint = {
      budget_limit = "5.0"
    },
    Polly = {
      budget_limit = "5.0"
    },
    Rekognition = {
      budget_limit = "5.0"
    },
    Redshift = {
      budget_limit = "5.0"
    },
    SFTP = {
      budget_limit = "5.0"
    },
    Route53 = {
      budget_limit = "5.0"
    },
    SageMaker = {
      budget_limit = "5.0"
    },
    SecretsManager = {
      budget_limit = "5.0"
    },
    ServiceCatalog = {
      budget_limit = "5.0"
    },
    SES = {
      budget_limit = "5.0"
    },
    SNS = {
      budget_limit = "5.0"
    },
    SQS = {
      budget_limit = "5.0"
    },
    SystemsManager = {
      budget_limit = "5.0"
    },
    Tax = {
      budget_limit = "5.0"
    },
    VPC = {
      budget_limit = "5.0"
    },
    WAF = {
      budget_limit = "5.0"
    },
    XRay = {
      budget_limit = "5.0"
    }
  }
}
