terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id ="81d99709-45bc-4c3a-bc06-b036378d01ea"
}

resource "azurerm_resource_group" "vnet_rg"{
name = var.resource_group_name
location = var.location
}


module "Az-network" {
    source = "./azure-vnet"
}

module "tf-ask" {
  source = "./azure-k8s"
}