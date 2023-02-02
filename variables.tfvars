#Enter in your subscription IDs from the Azure tenant here.
#Production Subscription
subscription_prod= "c6d43a91-b813-4be8-9969-7e6537f0e5d3" # Change to Clients Production Sub ID


#Shared Subscription
subscription_shared= "c6d43a91-b813-4be8-9969-7e6537f0e5d3" # Change to Clients Shared Sub ID

#Development Subscription
subscription_non_prod = "c6d43a91-b813-4be8-9969-7e6537f0e5d3" # Change to Clients Non-Prod Sub ID

#Subscription End -------------------------------------------------------------

#Set the default location for resources here ----------------------------------
location = "Australia East" #Default location, should not need to change

#Location end--------------------------------------------------------------------

#log Analytics Workspace ----------------------------
log_analytics_rg_name_shared = "rg-management-shared"


log_analytics_name_shared = "management-la"


#Storage Account Vars --------------------

la_storage_account_name = "saloggingshared"
la_storage_account_tags = "shared"
la_storage_account_tier = "Standard"
la_storage_account_replication_type = "LRS"
laStorageAccountAllowPublic = "false"
la_storage_account_tls_version = "TLS1_2"
la_storage_account_blob_soft_delete_days = 7
la_storage_account_container_soft_delete_days = 7
 # Container Name
la_storage_account_container_name  = "archivecontainer"
 # If account_tier is Premium use true
la_storage_account_infrastructure_encryption = "false"
la_storage_account_hns = "false"



la_stg_mgmt_policy_config_name = "archivedata"
la_stg_mgmt_policy_config_prefix_match = "archivecontainer"
la_stg_mgmt_policy_config_tier_cool_days = 10 
la_stg_mgmt_policy_config_tier_archive_days = 50
la_stg_mgmt_policy_config_blob_delete_days = 730
la_stg_mgmt_policy_config_snapsot_delete_days = 30


#Storage Account Vars end --------------------

#Configure the names of the resource groups that get deployed in the subscriptions.
rg_shared = "rg-shared-01" #Only change if you actually need too.

rg_management = "rg-management-01" #Only change if you actually need too.


#Resource Group end -------------------------------------------------------------------

#Policy Tags --------------------------------------------------
tag_values_mvc  = "['CostCenter', 'Owner', 'Team', 'Env']"
enable_tags = true                 #default setting

#Configure the names of the management groups -----------------------------------------------
management_groups = {
    az_platform = {
      id = "azure-platform"
      name   = "Azure Platform Root"
      parent   = "b85d2bfc-fee5-4e06-8585-3a88429b0545"
      sub_list = []
      level    = 1
    }
    shared_01 = {
      id = "shared-01"
      name   = "Shared Services"
      parent   = "azure-platform"
      sub_list = []
      level    = 2
    }
    workload_01 = {
      id = "work-load-01"
      name   = "Work Load"
      parent   = "azure-platform"
      sub_list = []
      level    = 2
    }
    workload_npe_01 = {
      id = "work-load-npe-01"
      name   = "Work Load Non-Production"
      parent   = "work-load-01"
      sub_list = ["c6d43a91-b813-4be8-9969-7e6537f0e5d3"]
      level    = 3
    }
}


#Configure management groups end ------------------------------------------------------

#Set the name of the keyvault ----------------------------------------------------------
key_vault_name_shared = "kv-mvc" #Only change if you actually need too.

#Set the name of the keyvault end ----------------------------------------------------------

#Set the names for the break gk=lass accounts ----------------------------------------------
bga_upn_one = "bga-one@datacomnzcps.onmicrosoft.com" #Change to clients domain


bga_display_name_one = "bga-one" #Leave as default unless need to change



bga_upn_two = "bga-two@datacomnzcps.onmicrosoft.com" #Change to clients domain


bga_display_name_two = "bga-two" #Leave as default unless need to change

#Set the names for the break gk=lass accounts end ----------------------------------------------

#Set the names of the default MVC groups -----------------------------------------------------
root_owner_group = "root_owner_group" #Leave as default unless need to change


root_contributor_group = "root_contributor_group" #Leave as default unless need to change


root_reader_group = "root_reader_group" #Leave as default unless need to change


#Platform Group Names
platform_owner_group = "platform_owner_group" #Leave as default unless need to change


platform_contributor_group = "platform_contributor_group" #Leave as default unless need to change


platform_reader_group = "platform_reader_group" #Leave as default unless need to change

#Workload Group Names
workload_owner_group = "workload_owner_group" #Leave as default unless need to change


workload_contributor_group = "workload_contributor_group" #Leave as default unless need to change


workload_reader_group = "workload_reader_group" #Leave as default unless need to change

#Set the names of the default MVC groups end -----------------------------------------------------

#Enable flags for addtional policy -----------------------------------------------------

enable_nzism = true                 #default setting
enable_azsecbm = false
enable_defender = false

#Enable flags for addtional policy end -----------------------------------------------------
