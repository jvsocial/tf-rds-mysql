# variables.tf

# AWS Access Key ID:
# This is a unique identifier that allows Terraform to authenticate with the AWS API.
# Make sure to keep this value secure and do not hard-code it in the Terraform scripts.
variable "access_key" {
  description = "The AWS Access Key ID to authenticate API requests"
  type        = string
  sensitive   = true
}

# AWS Secret Access Key:
# This is the secret key associated with the AWS Access Key ID.
# It is used to sign requests to the AWS API and should never be exposed publicly.
variable "secret_key" {
  description = "The AWS Secret Access Key for authentication"
  type        = string
  sensitive   = true
}

# AWS Default Region:
# The region where AWS resources will be created.
# Example: 'us-east-1', 'us-west-2', 'eu-central-1'.
variable "region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1" # Update this default value as per your requirements.
}

variable "rds_username" {
  default = "myrdsuser" # Replace with your desired default username
}

variable "rds_password" {
  description = "RDS instance password"
  sensitive   = true
}
