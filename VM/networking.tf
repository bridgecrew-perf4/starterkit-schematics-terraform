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

data "ibm_is_security_group" "vpc_security_group" {
    name = ibm_is_vpc.vpc_vm.security_group[0].group_name
}

resource "ibm_is_security_group_rule" "security_group_rule_tcp" {
  group     = data.ibm_is_security_group.vpc_security_group.id
  direction = "inbound"
  tcp {
    port_min = 22
    port_max = 22
  }
}

resource ibm_is_floating_ip "vpc_fip" {
  name   = "fip-${var.project}-${var.environment}-001"
  target = ibm_is_instance.vpc_vsi.0.primary_network_interface.0.id
  resource_group = data.ibm_resource_group.resourceGroup.id
}
