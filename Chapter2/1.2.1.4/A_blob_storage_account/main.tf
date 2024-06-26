# module "CloudNativeAzure-strg-backend" {
#   source = "../Modules/Services/Storage_accounts"
#   resource-grp-name = "CloudNativeAzure-group"
#   storage-account-name = "cnabookprod"
#   azure-dc = "westus"
#   storage-account-tier = "Standard"
#   storage-replication-type = "LRS"
#   storage-container-name = "cloud-native-devs"
#   storage-container-access = "private"
#   blob-name = "cloud-native-with-azure"
# }

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

module "CloudNativeAzure-strg-backend" {
  source = "../Modules/Services/Storage_accounts"
  resource-grp-name = "oscar-test"
  storage-account-name = "oscarcnabookprod"
  azure-dc = "koreacentral"
  storage-account-tier = "Standard"
  storage-replication-type = "LRS"
  storage-container-name = "cloud-native-devs"
  storage-container-access = "private"
  blob-name = "cloud-native-with-azure"
}
