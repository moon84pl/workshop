terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-02"
    storage_account_name = "warsztatystorage33123123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan-daosdjoias12"
  location            = "westeurope" 
  resource_group_name = "rg-02"
  os_type             = "Linux"
  sku_name            = "P0v3"
}


resource "azurerm_linux_web_app" "example" {
  name                = "example-webapp-asdoi3221op3kadasd"
  location            = "westeurope"
  resource_group_name = "rg-02"
  service_plan_id     = azurerm_service_plan.example.id
  site_config {}
}

resource "azurerm_linux_web_app" "example2" {
  name                = "example-webapp-asdoi3221op3kadasc"
  location            = "westeurope"
  resource_group_name = "rg-02"
  service_plan_id     = azurerm_service_plan.example.id
  site_config {}
}
