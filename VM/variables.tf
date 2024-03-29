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
    default = "ibm-redhat-8-4-minimal-amd64-2"
    description = "Imagen que se usara para la VM"
}

#ibmcloud is instance-profiles
variable "profile" {
    default = "bx2-16x64"
    description = "profil de la VM"
}

#https://cloud.ibm.com/docs/vpc?topic=vpc-ssh-keys#locating-ssh-keys
#https://cloud.ibm.com/vpc-ext/compute/sshKeys

variable "key" {
    type = list
    default = [""]
    description = "ID Keys"
}

#ibmcloud is vpc-address-prefixes <VPC Name>

variable "cdir" {
    default = "10.240.128.0/18"
    description = "Rango de IPs"
}

variable "cant_vsi" {
    default = "1"
    description = "Cantidad de VSI a crear"
}

variable "primary_ipv4_address" {
    default = "10.240.128.6"
    description = "IP Privada"
}