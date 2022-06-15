variable "resource_group_name" {
  description = "resource group to be used for deploying our resources"
  type = string
}

variable "location" {
    description = "default location for deploying our resources"
    type = string
    default = "westus2"
  
}