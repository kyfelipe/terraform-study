variable "name" {
  
}

variable "acl" {
  default = "private"
}

variable "tags" {
  type = map
  default = {}
}

variable "versioning" {
  default = false
}

variable "create_object" {
  default = false
}

variable "object_key" {
  default = ""
}

variable "object_source" {
  default = ""
}
