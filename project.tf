#Management Groups. If these need to be edited then it can be changed within the module
module "mg_create_lvl1" {
  source = "./modules/mgmtGroup"
  
  for_each = {
    for mg_key, mg_data in var.management_groups : mg_key => mg_data
    if mg_data.level == 1
  }
  
  management_group_details = each.value
}

module "mg_create_lvl2" {
  source = "./modules/mgmtGroup"
  
  for_each = {
    for mg_key, mg_data in var.management_groups : mg_key => mg_data
    if mg_data.level == 2
  }
  
  management_group_details = each.value

  depends_on = [
    module.mg_create_lvl1
  ]
}

module "mg_create_lvl3" {
  source = "./modules/mgmtGroup"
  
  for_each = {
    for mg_key, mg_data in var.management_groups : mg_key => mg_data
    if mg_data.level == 3
  }
  
  management_group_details = each.value

  depends_on = [
    module.mg_create_lvl2
  ]
}
#Resource groups, these get created under the provider you select.
module "resource_groups_shared" {
  source = "./modules/resource_group"
  providers = {
    azurerm = azurerm.shared
  }
  
  rgname = var.rg_shared
  location = var.location
}

module "resource_groups_management" {
  source = "./modules/resource_group"
  rgname = var.rg_management
  providers = {
    azurerm = azurerm.shared
  }
  location = var.location
}
#This is a single modoule that contains the MVC policies.
module "mvc_policies" {
  source              = "./modules/policy/policyAssignment"
  policy_scope        = module.mg_create_lvl1["az_platform"].id
}

module "mvc_policies_nzism" {
  source         = "./modules/policy/nzism"

  count = "${(var.enable_nzism) ? 1 : 0}"

  policy_scope   = module.mg_create_lvl1["az_platform"].id
  logAnalyticsId = module.log_analytics.log_analytics_id
  nzismlocation  = var.location
}

module "mvc_policies_asb" {
  source         = "./modules/policy/asb"

  count = "${(var.enable_azsecbm) ? 1 : 0}"

  policy_scope   = module.mg_create_lvl1["az_platform"].id
  asblocation  = var.location
}

module "mvc_policies_mdc" {
  source         = "./modules/policy/mdc"

  count = "${(var.enable_defender) ? 1 : 0}"

  policy_scope   = module.mg_create_lvl1["az_platform"].id
  defenderlocation  = var.location
}

module "mvc_policies_tags" {
  source         = "./modules/policy/tags"

  count = "${(var.enable_tags) ? 1 : 0}"

  policy_scope        = module.mg_create_lvl1["az_platform"].id
  tag_values           = var.tag_values_mvc
}

#This log analyics spins up a workspace but still needs to be configured in the portal.
module "log_analytics" {
  source = "./modules/log_analytics"
  providers = {
    azurerm = azurerm.shared
  }
  log_analytics_rg_name  = module.resource_groups_management.resource_group_name
  log_analytics_name     = var.log_analytics_name_shared
  log_analytics_location = var.location
}

#Storage Account for Log Analytics ------
module "storage_account" {
  source = "./modules/storage/storageAccount"
  providers = {
    azurerm = azurerm.shared
  }
  storage_account_name                  = var.la_storage_account_name
  location                              = var.location
  environment_tags                      = var.la_storage_account_tags
  storage_account_resource_group        = module.resource_groups_shared.resource_group_name
  account_tier                          = var.la_storage_account_tier
  account_replication_type              = var.la_storage_account_replication_type
  allow_nested_items_to_be_public       = var.laStorageAccountAllowPublic
  min_tls_version                       = var.la_storage_account_tls_version
  infrastructure_encryption_enabled     = var.la_storage_account_infrastructure_encryption
  is_hns_enabled                        = var.la_storage_account_hns
  blob_soft_delete_retention_days       = var.la_storage_account_blob_soft_delete_days
  container_soft_delete_retention_days  = var.la_storage_account_container_soft_delete_days
}

module "storage_container" {
  source   = "./modules/storage/container"
  providers = {
    azurerm = azurerm.shared
  }
  container_name	       = var.la_storage_account_container_name
  storage_account_name   = module.storage_account.name
  container_access_type  = "private"

depends_on = [module.storage_account]
}

#Mgmt Policy for Storage Account ------
module "stg_account_mgmt_policy" {
  source   = "./modules/storage/mgmtPolicy"
  providers = {
    azurerm = azurerm.shared
  }
  storage_account_id            = module.storage_account.id
  resource_group_name           = module.resource_groups_shared.resource_group_name
  rule_name						= var.la_stg_mgmt_policy_config_name
  prefix_match				    = var.la_stg_mgmt_policy_config_prefix_match
  tier_to_cool_days			    = var.la_stg_mgmt_policy_config_tier_cool_days
  tier_to_archive_days		    = var.la_stg_mgmt_policy_config_tier_archive_days
  blob_delete_after_days	    = var.la_stg_mgmt_policy_config_blob_delete_days
  snapshot_delete_after_days    = var.la_stg_mgmt_policy_config_snapsot_delete_days
  
depends_on = [module.storage_account]
}
#Storage Account end --------------

#This keyvault is made for the Break Glass Account passwords
module "keyvault" {
  source            = "./modules/key_vault"
  key_vault_name     = var.key_vault_name_shared
  key_vault_location  = var.location
  key_vault_rg_name = module.resource_groups_management.resource_group_name

  providers = {
    azurerm = azurerm.shared
  }
}

#breakglass account, this module can be repeated.
module "bga_one" {
  source = "./modules/break_glass_accounts"
  depends_on = [
    module.keyvault
  ]
  providers = {
    azurerm = azurerm.shared
  }
  bga_upn          = var.bga_upn_one
  bga_display_name = var.bga_display_name_one
  bga_secret_name  = var.bga_display_name_one
  bga_role_scope   = module.mg_create_lvl1["az_platform"].id
  bga_keyvault     = module.keyvault.key_vault_id
}

module "bga_two" {
  source = "./modules/break_glass_accounts"
  depends_on = [
    module.keyvault
  ]
  providers = {
    azurerm = azurerm.shared
  }
  bga_upn          = var.bga_upn_two
  bga_display_name = var.bga_display_name_two
  bga_secret_name  = var.bga_display_name_two
  bga_role_scope   = module.mg_create_lvl1["az_platform"].id
  bga_keyvault     = module.keyvault.key_vault_id
}

module "root_groups" {
  source                 = "./modules/ad_groups"
  ad_group_owner_name       = var.root_owner_group
  ad_group_contributor_name = var.root_contributor_group
  ad_group_reader_name      = var.root_reader_group
  owner_role_scope         = module.mg_create_lvl1["az_platform"].id
  contributer_role_scope   = module.mg_create_lvl1["az_platform"].id
  reader_role_scope        = module.mg_create_lvl1["az_platform"].id
}

module "platform_groups" {
  source                 = "./modules/ad_groups"
  ad_group_owner_name       = var.platform_owner_group
  ad_group_contributor_name = var.platform_contributor_group
  ad_group_reader_name      = var.platform_reader_group
  owner_role_scope         = module.mg_create_lvl1["az_platform"].id
  contributer_role_scope   = module.mg_create_lvl1["az_platform"].id
  reader_role_scope        = module.mg_create_lvl1["az_platform"].id
}

module "workloads_groups" {
  source                 = "./modules/ad_groups"
  ad_group_owner_name       = var.workload_owner_group
  ad_group_contributor_name = var.workload_contributor_group
  ad_group_reader_name      = var.workload_reader_group
  owner_role_scope         = module.mg_create_lvl1["az_platform"].id
  contributer_role_scope   = module.mg_create_lvl1["az_platform"].id
  reader_role_scope        = module.mg_create_lvl1["az_platform"].id
}
