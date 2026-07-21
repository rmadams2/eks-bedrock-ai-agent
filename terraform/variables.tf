variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "AWS Region hosting EKS and Bedrock"
}

variable "eks_cluster_name" {
  type        = string
  description = "Name of the target EKS cluster"
}

variable "app_image" {
  type        = string
  description = "Fully qualified Docker image URI (e.g., myregistry/agent:v1)"
}

variable "newrelic_license_key" {
  type        = string
  sensitive   = true
  description = "New Relic Ingest License Key"
}

variable "newrelic_account_id" {
  type        = string
  description = "New Relic Account ID"
}

variable "newrelic_api_key" {
  type        = string
  sensitive   = true
  description = "New Relic User API Key"
}