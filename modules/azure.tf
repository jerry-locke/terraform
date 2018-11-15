provider "azurerm" 
{
  subscription_id = "${var.subscription_id}"
  client_id = "${var.client_id}"
  client_secret = "${var.secret}"
  tenant_id = "${var.tenant}"
}

resource "azurerm_resource_group" "thisGroup"
{
  name="${var.rg}"
  location="${var.location}"
}

output "Resource Group Info"
{
  value="${azurerm_resource_group.thisGroup.name}"
}
