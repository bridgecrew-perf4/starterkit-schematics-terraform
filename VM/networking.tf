#Solo 10 VPC por region
resource "ibm_is_vpc" "vpc_vm" {
  count   = var.cant_vpc
  name = "vpc-${var.project}-${var.environment}-00${count.index + 1}"
  resource_group = data.ibm_resource_group.resourceGroup.id
  tags = var.tags
}

/*
resource ibm_is_subnet "vpc_subnet" {
  name = "subnet-${var.project}-${var.environment}-001"
  vpc  = element(ibm_is_vpc.vpc_vm, count.index).id
  #ibm_is_vpc.vpc_vm.id
  zone = element(var.zone, count.index)
  #var.zone
  ipv4_cidr_block = var.cdir
  resource_group = data.ibm_resource_group.resourceGroup.id
}

resource ibm_is_floating_ip "vpc_fip" {
  name   = "fip-${var.project}-${var.environment}-001"
  target = ibm_is_instance.vpc_vsi.primary_network_interface.0.id
  resource_group = data.ibm_resource_group.resourceGroup.id
}
*/