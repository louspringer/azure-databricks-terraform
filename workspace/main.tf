provider "azurerm" {
  features {}
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "managed_resource_group_name" {
  description = "The name of the managed resource group"
  type        = string
}

variable "location" {
  description = "The deployment location"
  type        = string
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_databricks_workspace" "databricks-workspace" {
  name                        = "databricks-workspace"
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  sku                         = "premium"
  managed_resource_group_name = var.managed_resource_group_name

}
