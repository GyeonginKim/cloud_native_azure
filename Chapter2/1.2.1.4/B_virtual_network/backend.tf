terraform {
  backend "azurerm" {
    resource_group_name  = "oscar-test"
    storage_account_name = "oscarcnabookprod"
    container_name       = "cloud-native-devs"
    key                  = "Virtual_network"
  }
}
