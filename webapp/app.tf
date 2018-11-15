resource "azurerm_app_service_plan" "thisAppPlan" {
    name="${var.prefix}webappplan"
    location="${var.location}"
    resource_group_name="${azurerm_resource_group.thisGroup.name}"
    sku{
        tier="Standard"
        size="S1"
    }
}

resource "azurerm_app_service" "thisWebApp" {
  name="${var.prefix}webapp"
  location="${var.location}"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  app_service_plan_id="${azurerm_app_service_plan.thisAppPlan.id}"
  depends_on=["azurerm_app_service_plan.thisAppPlan"]  
}


