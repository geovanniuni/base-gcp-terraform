variable "gcp_region" {
  type        = string
  description = "Region to use for GCP provider"
  default     = "us-central1"
}

variable "gcp_project" {
  type        = string
  description = "Project to use for this config"
}

variable "bucket_name" {
    type       = string
    description = "Bucket to store the terraform state, it can be created by the terraform file"
}

variable "bucket_prefix" {
    type       = string
    description = "bucket_name/bucket_prefix"
}