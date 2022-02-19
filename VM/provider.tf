terraform {
     required_providers {
      ibm = {
        source = "IBM-Cloud/ibm"
        version = "1.38.2"
      }
     }
  }

provider "ibm" {
  contar            = 1
  region           = element(var.region, contar.index)
  #var.region
  ibmcloud_api_key = var.ibmcloud_api_key
}