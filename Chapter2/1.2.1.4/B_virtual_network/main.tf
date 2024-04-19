provider "azurerm" {
    features {}
}
data "azurerm_resource_group" "resource-grp-name" {
  name = "oscar-test"
  //location = "koreacentral"
}

output "id" {
  value       = data.azurerm_resource_group.resource-grp-name.name
}
module "CloudNativeAzure-vnet" {
  source = "../Modules/Services/Virtual_network"
  vpc-cidr = ["10.0.0.0/16"]
  vpc-name = "cna-prod"
  subnet1-cidr = "10.0.1.0/24"
  subnet2-cidr = "10.0.2.0/24"
  subnet3-cidr = "10.0.3.0/24"
  network-secgrp-name = "cloudnative-public-firewall"
  resource-grp-name = data.azurerm_resource_group.resource-grp-name.name
  azure-dc = "koreacentral"
  env-type = "Production"
}
