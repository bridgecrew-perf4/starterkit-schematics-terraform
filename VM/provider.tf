terraform {
     required_providers {
      ibm = {
        source = "IBM-Cloud/ibm"
        version = "1.38.2"
      }
     }
  }

provider "ibm" {
  region           = element(var.region, count.index)
  #var.region
  ibmcloud_api_key = var.ibmcloud_api_key
}