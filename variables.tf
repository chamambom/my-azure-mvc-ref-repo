#Enter in your subscription IDs from the Azure tenant here.
#Production Subscription
variable "subscription_prod" {
  description = "Name for Production to add to Management Group"
 
}

#Shared Subscription
variable "subscription_shared" {
  description = "Name for Shared to add to Management Group"
}
#Development Subscription
variable "subscription_non_prod" {
  description = "Name for Development to add to Management Group"
}
#Subscription End -------------------------------------------------------------

#Set the default location for resources here ----------------------------------
variable "location" {
  description = "Name for location"
}
#Location end--------------------------------------------------------------------

#log Analytics Workspace ----------------------------
variable "log_analytics_rg_name_shared" {
  description = "log analytics rg name"
}

variable "log_analytics_name_shared" {
  description = "log analytics name"
}

#Storage Account Vars --------------------
variable    "la_storage_account_name" {
  description = "log analytics name"
}
variable    "la_storage_account_tags" {
  description = "log analytics Storage Account Tag"
}
variable    "la_storage_account_tier" {
  description = "log analytics Storage Account Tier"
}
variable    "la_storage_account_replication_type" {
  description = "log analytics Storage Account Replication Type"
}
variable    "laStorageAccountAllowPublic" {
  description = "log analytics Storage Account Allow Public"
}
variable    "la_storage_account_tls_version" {
  description = "log analytics Storage Account Tls Version"
}
variable    "la_storage_account_blob_soft_delete_days" {
  description = "log analytics Storage Account Blob Soft Delete Days"
}
variable    "la_storage_account_container_soft_delete_days" {
  description = "log analytics Storage Account Container Soft Delete Days"
}
 # Container Name
variable    "la_storage_account_container_name" {
  description = "log analytics Storage Account Container Name"
}
 # If account_tier is Premium use true
variable    "la_storage_account_infrastructure_encryption" {
  description = "log analytics Storage Account Infra Encryption"
}
variable    "la_storage_account_hns" {
  description = "log analytics Storage Account Hns"
}
variable    "la_stg_mgmt_policy_config_name"	{
  description = "log analytics Stg Mgmt Policy Config Name"
}
variable    "la_stg_mgmt_policy_config_prefix_match" {
  description = "log analytics Stg Mgmt Policy Config Prefix Match"
}
variable    "la_stg_mgmt_policy_config_tier_cool_days" {
  description = "log analytics Stg Mgmt Policy Config Tier Cool Days"
}
variable    "la_stg_mgmt_policy_config_tier_archive_days" {
  description = "log analytics Stg Mgmt Policy Config Tier Archive Days"
}
variable    "la_stg_mgmt_policy_config_blob_delete_days" {
  description = "log analytics Stg Mgmt Policy Config Blob Delete Days"
}
variable    "la_stg_mgmt_policy_config_snapsot_delete_days" {
  description = "log analytics Stg Mgmt Policy Config Snapshot Delete Days"
}

#Storage Account Vars end --------------------

#Configure the names of the resource groups that get deployed in the subscriptions.
variable "rg_shared" {
  description = "Name for Shared Resource Group"
  default     = "rg-shared-01" #Only change if you actually need too.
}

variable "rg_management" {
  description = "Name for Management Resource Group"
  default     = "rg-management-01" #Only change if you actually need too.
}

#Resource Group end -------------------------------------------------------------------

#Policy Tags --------------------------------------------------
variable "tag_values_mvc" {
  description = "values for tags to audit"
  default     = "['CostCenter', 'Owner', 'Team', 'Env']"
}

variable "enable_tags" {
  description = "Enable Defender policy"
  type = bool
}

#Policy flags --------------------------------------------------

variable "enable_nzism" {
  description = "Enable NZISM policy"
  type = bool
}

variable "enable_azsecbm" {
  description = "Enable Azure Security Benchmark policy"
  type = bool
}

variable "enable_defender" {
  description = "Enable Defender policy"
  type = bool
}

#Configure the names of the management groups -----------------------------------------------

variable "management_groups" {
  type = map(object({
    id       = string
    name     = string
    parent   = string
    sub_list = list(string)
    level    = number
  }))
}

#Configure management groups end ------------------------------------------------------

#Set the name of the keyvault ----------------------------------------------------------
variable "key_vault_name_shared" {
  description = "Keyvault for MVC"
  default     = "kv-mvc" #Only change if you actually need too.
}
#Set the name of the keyvault end ----------------------------------------------------------

#Set the names for the break gk=lass accounts ----------------------------------------------
variable "bga_upn_one" {
  description = "UPN name for Break Glass account"
  default     = "bga-one@datacomnzcps.onmicrosoft.com" #Change to clients domain
}

variable "bga_display_name_one" {
  description = "Display name for Break Glass account"
  default     = "bga-one" #Leave as default unless need to change
}


variable "bga_upn_two" {
  description = "UPN name for Break Glass account"
  default     = "bga-two@datacomnzcps.onmicrosoft.com" #Change to clients domain
}

variable "bga_display_name_two" {
  description = "Display name for Break Glass account"
  default     = "bga-two" #Leave as default unless need to change
}
#Set the names for the break gk=lass accounts end ----------------------------------------------

#Set the names of the default MVC groups -----------------------------------------------------
variable "root_owner_group" {
  default = "root_owner_group" #Leave as default unless need to change
}

variable "root_contributor_group" {
  default = "root_contributor_group" #Leave as default unless need to change
}

variable "root_reader_group" {
  default = "root_reader_group" #Leave as default unless need to change
}

#Platform Group Names
variable "platform_owner_group" {
  default = "platform_owner_group" #Leave as default unless need to change
}

variable "platform_contributor_group" {
  default = "platform_contributor_group" #Leave as default unless need to change
}

variable "platform_reader_group" {
  default = "platform_reader_group" #Leave as default unless need to change
}
#Workload Group Names
variable "workload_owner_group" {
  default = "workload_owner_group" #Leave as default unless need to change
}

variable "workload_contributor_group" {
  default = "workload_contributor_group" #Leave as default unless need to change
}

variable "workload_reader_group" {
  default = "workload_reader_group" #Leave as default unless need to change
}
#Set the names of the default MVC groups end -----------------------------------------------------



