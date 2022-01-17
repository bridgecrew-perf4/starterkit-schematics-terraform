terraform {
     required_providers {
      ibm = {
        source = "IBM-Cloud/ibm"
        version = "1.38.0"
      }
     }
  }

provider "ibm" {
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
}