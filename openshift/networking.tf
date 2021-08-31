#Solo 10 VPC por region
resource "ibm_is_vpc" "vpc_openshift" {
  name = "vpc-${var.project}-${var.environment}-001"
  resource_group = data.ibm_resource_group.resourceGroup.id
  tags = var.tags
}

data "ibm_is_vpc_default_routing_table" "vpc_routing_table" {
    vpc = ibm_is_vpc.vpc_openshift.id
}

data "ibm_is_security_group" "vpc_security_group" {
    name = ibm_is_vpc.vpc_openshift.security_group[0].group_name
}

resource "ibm_is_security_group_rule" "security_group_rule_tcp" {
  group     = data.ibm_is_security_group.vpc_security_group.id
  direction = "inbound"
  tcp {
    port_min = 30000
    port_max = 32767
  }
}

resource "ibm_is_security_group_rule" "security_group_rule_udp" {
  group     = data.ibm_is_security_group.vpc_security_group.id
  direction = "inbound"
  udp {
    port_min = 30000
    port_max = 32767
  }
}

resource "ibm_is_public_gateway" "publicgateway" {
  name = "pgw-${var.project}-${var.environment}-001"
  vpc  = ibm_is_vpc.vpc_openshift.id
  zone = var.zone
  resource_group = data.ibm_resource_group.resourceGroup.id

  timeouts {
    create = "90m"
  }
}

resource "ibm_is_subnet" "vpc_subnet" {
  name            = "subnet-${var.project}-${var.environment}-001"
  vpc             = ibm_is_vpc.vpc_openshift.id
  zone            = var.zone
  ipv4_cidr_block = var.cdir
  routing_table   = data.ibm_is_vpc_default_routing_table.vpc_routing_table.default_routing_table
  public_gateway  = ibm_is_public_gateway.publicgateway.id
  resource_group = data.ibm_resource_group.resourceGroup.id

  timeouts {
    create = "90m"
    delete = "30m"
  }
}