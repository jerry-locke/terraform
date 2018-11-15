#######################
# Network Configuration
#######################

resource "azurerm_virtual_network" "thisNetwork"
{
  name="${var.prefix}tfvnet"
  address_space=["10.0.0.0/16"]
  location="${var.location}"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  tags{
    environment="Testing"
  }
}

resource "azurerm_subnet" "thisSubnet"
{
  name="${var.prefix}tfsubnet"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  virtual_network_name="${azurerm_virtual_network.thisNetwork.name}"
  address_prefix="10.0.1.0/24"
}

resource "azurerm_public_ip" "thisIp"
{
  name="${var.prefix}tfpublicip"
  location="${var.location}"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  public_ip_address_allocation="static"
  tags{
    environment="Testing"
  }
  
  provisioner "local-exec" 
  {
    command = "echo ${self.ip_address}"
    on_failure = "continue"
  }

  provisioner "local-exec"
  {
    command = "echo 'Adios Pub IP'"
    when = "destroy"
  }
}

resource "azurerm_network_security_group" "thisNsg"
{
  name="${var.prefix}nsg"
  location="${var.location}"
  resource_group_name="${azurerm_resource_group.thisGroup.name}"
  security_rule
  {
    name="SSH"
    priority=1003
    direction="Inbound"
    access="Allow"
    protocol="TCP"
    source_port_range="*"
    destination_port_range="22"
    source_address_prefix="*"
    destination_address_prefix="*"
  }
}

