variable "storage_account_resource_group" {
  type        = string
  description = "resource group name"
}

variable "location" {
  description = "location"
  type        = string
}

variable "storage_account_name" {
  type        = string
  description = "storage account name"
}

variable "account_tier" {
  type        = string
  description = "storage account tier"
}

variable "account_replication_type" {
  type        = string
  description = "account replication type"
}

variable "allow_nested_items_to_be_public" {
  type        = string
  description = "allow nested items to be public"
}

variable "min_tls_version" {
  type        = string
  description = "account blob public access"
}

variable "infrastructure_encryption_enabled" {
  type        = string
  description = "account locked to prevent accidental deletion"
}

variable "is_hns_enabled" {
  type        = string
  description = "account locked to prevent accidental deletion"
}

variable "blob_soft_delete_retention_days" {
  type        = string
  description = "account locked to prevent accidental deletion"
}

variable "container_soft_delete_retention_days" {
  type        = string
  description = "account locked to prevent accidental deletion"
}

variable "environment_tags" {
  type        = string
  description = "Environment Tags"
}