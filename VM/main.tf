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


resource "ibm_is_instance" "vpc_vsi" {
  count   = var.cant_vsi
  name    = "vm-${var.project}-${var.environment}-00${count.index + 1}"
  image   = data.ibm_is_image.image_vm.id
  profile = var.profile
  resource_group = data.ibm_resource_group.resourceGroup.id
  primary_network_interface {
    subnet = ibm_is_subnet.vpc_subnet.id
    primary_ipv4_address = var.primary_ipv4_address
    allow_ip_spoofing = false
  }

  vpc  = ibm_is_vpc.vpc_vm.id
  zone = var.zone
  keys = var.key


  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
