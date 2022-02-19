#Solo 10 VPC por region
resource "ibm_is_vpc" "vpc_vm" {
  name = "vpc-${var.project}-${var.environment}-001"
  resource_group = data.ibm_resource_group.resourceGroup.id
  tags = var.tags
}

resource ibm_is_subnet "vpc_subnet" {
  name = "subnet-${var.project}-${var.environment}-001"
  vpc  = ibm_is_vpc.vpc_vm.id
  zone = var.zone
  ipv4_cidr_block = var.cdir
  resource_group = data.ibm_resource_group.resourceGroup.id
}

resource ibm_is_floating_ip "vpc_fip" {
  name   = "fip-${var.project}-${var.environment}-001"
  target = ibm_is_instance.vpc_vsi.primary_network_interface.0.id
  resource_group = data.ibm_resource_group.resourceGroup.id
}
