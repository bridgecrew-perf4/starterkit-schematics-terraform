terraform {
     required_providers {
      ibm = {
        source = "IBM-Cloud/ibm"
        version = "1.39.0-beta0"
      }
     }
  }

provider "ibm" {
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
}