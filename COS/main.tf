data "ibm_resource_group" "cos_group" {
  name = var.resource_group_name
}

resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_name
  resource_group_id = data.ibm_resource_group.cos_group.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}