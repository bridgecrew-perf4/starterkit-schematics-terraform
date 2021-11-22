variable "resource_group_name" {
    default = ""
    description = "Nombre del rg donde se desea crear los recursos o dejar en blanco para crear uno nuevo"
}

variable "cos_name" {
    default = "cos-instance"
    description = "Nombre de COS"
}