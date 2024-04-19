provider "azurerm" {
    features {}
}
data "azurerm_resource_group" "rg" {
  name = "oscar-test"
  //location = "koreacentral"
}

output "id" {
  value       = data.azurerm_resource_group.rg.name
}
