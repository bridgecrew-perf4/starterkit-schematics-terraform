resource "ibm_resource_group" "rg" {
  count = var.resource_group_name != " " ? 0 : 1
  name     = var.resource_group_name != " " ? var.resource_group_name : "rg-${var.project}-${var.environment}"
}

data "ibm_resource_group" "resourceGroup" {
  name = var.resource_group_name != " " ? var.resource_group_name : ibm_resource_group.rg[0].name
}

data ibm_is_image "image_vm" {
  name = var.image
}

resource ibm_is_instance "vm" {
  name    = "vm-${var.project}-${var.environment}-001"
  resource_group = data.ibm_resource_group.resourceGroup.id
  vpc     = ibm_is_vpc.vpc_vm.id
  zone    = var.zone
  keys    = ["${var.key}"]
  image   = data.ibm_is_image.image_vm.id
  profile = var.profile

  primary_network_interface = {
    subnet          = ibm_is_subnet.vpc_subnet.id
    security_groups = ["${ibm_is_security_group.vpc_security_group.id}"]
  }
}



