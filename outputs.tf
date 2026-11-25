output "cloudtrail_arn" {
  description = "ARN of the CloudTrail trail (null if disabled)."
  value       = try(aws_cloudtrail.this[0].arn, null)
}

output "cloudtrail_bucket_name" {
  description = "Name of the S3 bucket that stores CloudTrail logs (null if disabled)."
  value       = try(aws_s3_bucket.cloudtrail[0].id, null)
}

output "guardduty_detector_id" {
  description = "ID of the GuardDuty detector (null if disabled)."
  value       = try(aws_guardduty_detector.this[0].id, null)
}
