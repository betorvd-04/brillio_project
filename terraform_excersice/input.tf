variable storage_bucket_name {
    type    = string
    default = "image-store.com"
}

variable "storage_bucket_loc" {
    type    = string
    default = "EU"
}

variable "vpc_name" {
    type    = string
    default = "vpc-network"
}

variable "subnet_name_1" {
    type    = string
    default = "subnet-1"
}

variable "subnet_name_2" {
    type    = string
    default = "subnet-2"
}

variable "subnet_name_3" {
    type    = string
    default = "subnet-3"
}

variable "compute_firewall" {
    type    = string
    default = "allow-all"
}

variable "compute_instance_name1" {
    type    = string
    default = "web-server-instance1"
}

variable "compute_instance_name2" {
    type    = string
    default = "web-server-instance2"
}

variable "compute_instance_db" {
    type    = string   
    default = "db-server-instance"
}