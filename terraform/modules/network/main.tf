resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${var.rg-name}"

  tags = {
    environment = "${var.env}",
    project = "${var.project}"
  }
}

# Create subnet

resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = "${var.rg-name}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}