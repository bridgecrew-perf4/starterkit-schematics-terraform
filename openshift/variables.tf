variable "ibmcloud_api_key" {
    default = ""
    description = "Apikey Requerido para crear componentes"
}

variable "resource_group_name" {
    default = ""
    description = "Nombre del rg donde se desea crear los recursos o dejar en blanco para crear uno nuevo"
}

variable "members" {
    type = list
    default = ["example@gmail.com", "example@ibm.com"]
    description = "Usuarios que perteneceran al grupo de accesos"
}

variable "tags" {
    type = list
    default = ["project", "owner"]
    description = "Tags para identificar componentes"
}

variable "project" {
    default = "demo"
    description = "Nombre del proyecto para el cual se crea el cluster"
}

variable "environment" {
    default = "dev"
    description = "Ambiente para el cual se crea el cluster"
}

#Elegir zona de la lista obtenida con ibmcloud ks zone ls --provider vpc-gen2
variable "zone" {
    default = "eu-de-3"
    description = "Zona donde se crearan los recursos"
}
#Elegir version de openshift obtenida con ibmcloud ks versions
variable "kube_version" {
    default = "4.8.21_openshift"
    description = "Version de openshift - ejecutar ibmcloud ks versions para obtener la ultima version"
}
#Elegir flavor de la lista obtenida con ibmcloud ks flavors --zone eu-de-3
variable "flavor" {
    default = "bx2.4x16"
    description = "Tamaño de los workers"
}

variable "region" {
    default = "eu-de"
    description = "Region donde se crearan los componentes"
}
#requiere un rango de IPs de 
variable "cdir" {
    default = "10.243.129.0/24"
    description = "Rango de IPs"
}

variable "worker_count" {
    default = "3"
    description = "Cantidad de Workers"
}

variable "cluster_count" {
    default = "1"
    description = "Cantidad de Clusters"
}

variable "ODF" {
    default = false
    description = "Cantidad de Clusters"
}
