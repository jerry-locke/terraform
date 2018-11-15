# VNet
resource "azurerm_virtual_network" "thisNetwork"
{
  name="table5jltfvnet"
  address_space=["10.0.0.0/16"]
  location="${var.location}"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  tags{
    environment="Testing"
  }
}

resource "azurerm_subnet" "thisSubnet"
{
  name="table5jltfsubnet"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  virtual_network_name="${azurerm_virtual_network.thisNetwork.name}"
  address_prefix="10.0.1.0/24"
}

resource "azurerm_public_ip" "thisIp"
{
  name="table5jltfpublicip"
  location="${var.location}"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  public_ip_address_allocation="dynamic"
  tags{
    environment="Testing"
  }
}

# VM
/*
resource "azurerm_virtual_machine" "thisVm"
{
  name="table5jltfvm"
  location="${var.location}"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  network_interface_ids=["${name}"]
}
*/
