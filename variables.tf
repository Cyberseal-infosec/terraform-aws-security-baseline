variable "name_prefix" {
  description = "Prefix used for the names of all resources created by this module."
  type        = string
  default     = "security-baseline"
}

variable "enable_cloudtrail" {
  description = "Create a multi-region CloudTrail with log file validation and an encrypted, private S3 bucket."
  type        = bool
  default     = true
}

variable "enable_guardduty" {
  description = "Enable Amazon GuardDuty threat detection in this region."
  type        = bool
  default     = true
}

variable "enable_account_public_access_block" {
  description = "Block all public S3 access at the AWS account level."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow Terraform to delete the CloudTrail log bucket even if it contains logs."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to all resources that support tags."
  type        = map(string)
  default     = {}
}
