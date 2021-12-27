resource "ibm_iam_access_group" "accessgroup" {
  count = var.resource_group_name != " " ? 0 : 1
  name = "ag-${var.project}-${var.environment}-001"
}

#los nombres de los recursos utilizados dentro de la politica fueron extraidos usando "ibmcloud catalog service-marketplace"
#Tipos de roles disponibles: ["Administrator","Manager","Viewer", "Writer", "Operator","Reader","Editor"]
resource "ibm_iam_access_group_policy" "policyk8s" {
  count = var.resource_group_name != " " ? 0 : 1
  access_group_id = ibm_iam_access_group.accessgroup[count.index].id
  roles           = ["Administrator", "Manager"]
  resources { 
      service = "containers-kubernetes"
      resource_group_id = data.ibm_resource_group.resourceGroup.id
   }
}

resource "ibm_iam_access_group_policy" "policycos" {
  count = var.resource_group_name != " " ? 0 : 1
  access_group_id = ibm_iam_access_group.accessgroup[count.index].id
  roles           = ["Manager"]
  resources { 
      service = "cloud-object-storage"
      resource_group_id = data.ibm_resource_group.resourceGroup.id
   }
}

resource "ibm_iam_access_group_policy" "policycr" {
  count = var.resource_group_name != " " ? 0 : 1
  access_group_id = ibm_iam_access_group.accessgroup[count.index].id
  roles           = ["Administrator"]
  resources { 
      service = "container-registry"
   }
}

resource "ibm_iam_access_group_policy" "policyisvpc" {
  count = var.resource_group_name != " " ? 0 : 1
  access_group_id = ibm_iam_access_group.accessgroup[count.index].id
  roles           = ["Administrator"]
  resources {
    service = "is"
    resource_group_id = data.ibm_resource_group.resourceGroup.id
  }
}

resource "ibm_iam_access_group_policy" "policycm" {
  count = var.resource_group_name != " " ? 0 : 1
  access_group_id = ibm_iam_access_group.accessgroup[count.index].id
  roles           = ["Administrator", "Operator"] 
  resources {
    service = "cloudcerts"
    resource_group_id = data.ibm_resource_group.resourceGroup.id
  }
}

resource "ibm_iam_access_group_policy" "policyrg" {
  count = var.resource_group_name != " " ? 0 : 1
  access_group_id = ibm_iam_access_group.accessgroup[count.index].id
  roles           = ["Viewer"]
  resources {
    resource_type = "resource-group"
    resource = data.ibm_resource_group.resourceGroup.id
  }
}

resource "ibm_iam_access_group_members" "accessgroupmembers" {
  count = var.resource_group_name != " " ? 0 : 1
  access_group_id = ibm_iam_access_group.accessgroup[count.index].id
  ibm_ids         = var.members
}