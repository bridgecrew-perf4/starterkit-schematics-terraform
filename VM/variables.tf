variable "ibmcloud_api_key" {
    default = ""
    description = "Apikey Requerido para crear componentes"
}

variable "resource_group_name" {
    default = " "
    description = "Nombre del rg donde se desea crear los recursos o dejar en blanco para crear uno nuevo"
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

#ibmcloud is regions
variable "region" {
    default = "us-south"
    description = "Region donde se crearan los componentes"
}

#ibmcloud is zones
variable "zone" {
    default = "us-south-3"
    description = "Zona donde se crearan los recursos"
}

#ibmcloud is images
variable "image" {
    default = "ibm-redhat-8-2-minimal-amd64-4"
    description = "Imagen que se usara para la VM"
}

#ibmcloud is instance-profiles
variable "profile" {
    default = "bx2-8x32"
    description = "profil de la VM"
}

#https://cloud.ibm.com/vpc-ext/compute/sshKeys
variable "key" {
    type = list
    default = [""]
    description = "ID Keys"
}