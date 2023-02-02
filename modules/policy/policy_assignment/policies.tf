#Policy Allow Locations Start ------------------------------

data "azurerm_policy_definition" "allow_loc" {
  display_name = "Allowed locations"
}

resource "azurerm_management_group_policy_assignment" "location_assignment" {
  name                 = "locationpolicyassignment"
  management_group_id          = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.allow_loc.id
  description          = "MVC Policy Allow Location"
  display_name         = "MVC Allow Location"

  metadata = <<METADATA
    {
    "category": "General"
    }
METADATA

  parameters = <<PARAMETERS
{
  "listOfAllowedLocations": {
    "value": [ 
        "australiasoutheast",
        "australia",
        "australiaeast"
     ]
  }
}
PARAMETERS

}

#Policy Allow Locations Ends ------------------------------