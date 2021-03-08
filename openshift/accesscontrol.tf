resource "ibm_iam_access_group" "accessgroup" {
  name = "ag-${var.project}-${var.environment}-001"
}

#los nombres de los recursos utilizados dentro de la politica fueron extraidos usando "ibmcloud catalog service-marketplace"
#Tipos de roles disponibles: ["Administrator","Manager","Viewer", "Writer", "Operator","Reader","Editor"]
resource "ibm_iam_access_group_policy" "policyk8s" {
  access_group_id = ibm_iam_access_group.accessgroup.id
  roles           = ["Administrator", "Manager"]
  resources { 
      service = "containers-kubernetes"
      resource_group_id = ibm_resource_group.resourceGroup.id
   }
}

resource "ibm_iam_access_group_policy" "policycos" {
  access_group_id = ibm_iam_access_group.accessgroup.id
  roles           = ["Manager"]
  resources { 
      service = "cloud-object-storage"
      resource_group_id = ibm_resource_group.resourceGroup.id
   }
}

resource "ibm_iam_access_group_policy" "policycr" {
  access_group_id = ibm_iam_access_group.accessgroup.id
  roles           = ["Administrator"]
  resources { 
      service = "container-registry"
   }
}

resource "ibm_iam_access_group_policy" "policyisvpc" {
  access_group_id = ibm_iam_access_group.accessgroup.id
  roles           = ["Administrator"]
  resources {
    service = "is"
    resource_group_id = ibm_resource_group.resourceGroup.id
  }
}

resource "ibm_iam_access_group_policy" "policycm" {
  access_group_id = ibm_iam_access_group.accessgroup.id
  roles           = ["Administrator", "Operator"] 
  resources {
    service = "cloudcerts"
    resource_group_id = ibm_resource_group.resourceGroup.id
  }
}

resource "ibm_iam_access_group_policy" "policyrg" {
  access_group_id = ibm_iam_access_group.accessgroup.id
  roles           = ["Viewer"]
  resources {
    resource_type = "resource-group"
    resource = ibm_resource_group.resourceGroup.id
  }
}

resource "ibm_iam_access_group_members" "accessgroupmembers" {
  access_group_id = ibm_iam_access_group.accessgroup.id
  ibm_ids         = var.members
}