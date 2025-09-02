variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace for the service account"
}

variable "service_account_name" {
  type        = string
  description = "Kubernetes service account name"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name for read-only access"
}
