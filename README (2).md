# terraform-aws-security-baseline

A small Terraform module that applies a basic security baseline to an AWS account:

- **CloudTrail**: multi-region trail with log file validation, writing to a private, encrypted, versioned S3 bucket that denies insecure (non-HTTPS) access
- **GuardDuty**: threat detection enabled in the current region
- **S3 account-level public access block**: stops any bucket in the account from being made public

Each feature can be switched on or off with a variable.

## Usage

```hcl
module "security_baseline" {
  source  = "<your-github-org>/security-baseline/aws"
  version = "1.0.0"

  name_prefix = "acme-prod"

  tags = {
    Environment = "production"
  }
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `name_prefix` | Prefix for resource names | `string` | `"security-baseline"` |
| `enable_cloudtrail` | Create the CloudTrail trail and log bucket | `bool` | `true` |
| `enable_guardduty` | Enable GuardDuty | `bool` | `true` |
| `enable_account_public_access_block` | Block public S3 access account-wide | `bool` | `true` |
| `force_destroy` | Allow deleting the log bucket with logs inside | `bool` | `false` |
| `tags` | Tags for all taggable resources | `map(string)` | `{}` |

## Outputs

| Name | Description |
|------|-------------|
| `cloudtrail_arn` | ARN of the trail |
| `cloudtrail_bucket_name` | Name of the log bucket |
| `guardduty_detector_id` | ID of the GuardDuty detector |

## Requirements

- Terraform >= 1.3.0
- AWS provider >= 5.0

## Notes

This module is a starting point. A security baseline is only one part of a wider cybersecurity programme, so review it against your own compliance requirements.

## Maintained by

[Cyber Seal](https://www.thecyberseal.com/) – cybersecurity services and certification.
