#Solo 10 VPC por region
resource "ibm_is_vpc" "vpc_vm" {
  name = "vpc-${var.project}-${var.environment}-001"
  resource_group = data.ibm_resource_group.resourceGroup.id
  tags = var.tags
}

resource ibm_is_security_group "vpc_security_group" {
  name = "sg-${var.project}-${var.environment}-001"
  vpc  = ibm_is_vpc.vpc_vm.id
}

resource "ibm_is_security_group_rule" "ingress_ssh_all" {
  group     = ibm_is_security_group.vpc_security_group.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

resource ibm_is_subnet "vpc_subnet" {
  name = "subnet-${var.project}-${var.environment}-001"
  vpc  = ibm_is_vpc.vpc_vm.id
  zone = var.zone
  ipv4_cidr_block = "10.240.0.0/24"
}

/*
resource ibm_is_floating_ip "vpc_fip" {
  name   = "fip-${var.project}-${var.environment}-001"
  target = ibm_is_instance.vm.primary_network_interface.0.id
}
*/