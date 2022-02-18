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

#ibmcloud is zones
variable "zone" {
    default = "eu-de-3"
    description = "Zona donde se crearan los recursos"
}

#ibmcloud is regions
variable "region" {
    default = "eu-de"
    description = "Region donde se crearan los componentes"
}

#Ejecutar ibmcloud is images y tomar el valor de OS name
variable "image" {
    default = "red-8-amd64"
    description = "Imagen que se usara para la VM"
}

#ibmcloud is instance-profiles
variable "profile" {
    default = "bx2-8x32"
    description = "profil de la VM"
}

#ibmcloud is keys
variable "key" {
    type = list
    default = [""]
    description = "ID Keys"
}