resource "ibm_resource_group" "resourceGroup" {
  name     = "rg-${var.project}-${var.environment}"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = "cos-${var.project}-${var.environment}-001"
  resource_group_id = ibm_resource_group.resourceGroup.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}

resource "ibm_container_vpc_cluster" "cluster" {
  name              = "cocp-${var.project}-${var.environment}-001"
  vpc_id            = ibm_is_vpc.vpc_openshift.id 
  cos_instance_crn  = ibm_resource_instance.cos_instance.id
  kube_version      = var.kube_version
  flavor            = var.flavor
  worker_count      = var.worker_count
  resource_group_id = ibm_resource_group.resourceGroup.id
  wait_till         = "OneWorkerNodeReady"
  zones {
      subnet_id = ibm_is_subnet.vpc_subnet.id
      name      = var.zone
    }
}
