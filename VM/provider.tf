terraform {
     required_providers {
      ibm = {
        source = "IBM-Cloud/ibm"
        version = "1.38.2"
      }
     }
  }

provider "ibm" {
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
}