resource "ibm_resource_group" "rg" {
  count = var.resource_group_name != "" ? 0 : 1
  name     = var.resource_group_name != "" ? var.resource_group_name : "rg-${var.project}-${var.environment}"
}

data "ibm_resource_group" "resourceGroup" {
  name = var.resource_group_name != "" ? var.resource_group_name : "rg-${var.project}-${var.environment}"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = "cos-${var.project}-${var.environment}-001"
  resource_group_id = data.ibm_resource_group.resourceGroup.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  tags = var.tags
}

resource "ibm_container_vpc_cluster" "cluster" {
  count             = var.cluster_count
  name              = "cocp-${var.project}-${var.environment}-00${count.index + 1}"
  vpc_id            = ibm_is_vpc.vpc_openshift.id 
  cos_instance_crn  = ibm_resource_instance.cos_instance.id
  kube_version      = var.kube_version
  flavor            = var.flavor
  worker_count      = var.worker_count
  resource_group_id = data.ibm_resource_group.resourceGroup.id
  wait_till         = "OneWorkerNodeReady"
  tags = var.tags
  zones {
      subnet_id = ibm_is_subnet.vpc_subnet.id
      name      = var.zone
    }
}

#openshift data foundation
resource "ibm_container_vpc_worker_pool" "df_wpool" {
  cluster          = ibm_container_vpc_cluster.cluster[0].id
  worker_pool_name = "df_wpool"
  flavor           = "bx2.16x64"
  vpc_id           = ibm_is_vpc.vpc_openshift.id
  worker_count     = "3"
  resource_group_id = data.ibm_resource_group.resourceGroup.id
  entitlement      = var.entitlement_wp
  zones {
      subnet_id = ibm_is_subnet.vpc_subnet.id
      name      = var.zone
    }
}