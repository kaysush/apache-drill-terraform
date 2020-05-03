variable "instance_count" {
  type = number
}

variable "random_suffix" {
    type = string
}

variable "machine_type" {
    type = string
}

variable "zone" {
    type = string
}

variable "image_project" {
    type = string
}

variable "image_family" {
    type = string
}

variable "startup_script" {
    type = string
}

variable "network" {
    type = string
}