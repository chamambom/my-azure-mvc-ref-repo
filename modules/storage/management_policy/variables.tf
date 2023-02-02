variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "storage_account_id" {
  type        = string
  description = "storage account id"
}

variable "rule_name" {
  type        = string
  description = "prefix pattern match"
}

variable "prefix_match" {
  type        = string
  description = "prefix pattern match"
}

variable "tier_to_cool_days" {
  type        = string
  description = "to cool tier in days"
}

variable "tier_to_archive_days" {
  type        = string
  description = "to archive tier in days"
}

variable "blob_delete_after_days" {
  type        = string
  description = "blob delete days"
}

variable "snapshot_delete_after_days" {
  type        = string
  description = "snapshot delete days"
}