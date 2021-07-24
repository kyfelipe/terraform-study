variable "amis" {
  type = "map"

  default = {
    "us-east-1" = "ami-04b9e92b5572fa0d1"
    "us-east-2" = "ami-0d5d9d301c853a04a"
  }
}

variable "cdirs_remote_access" {
  type = "list"
  
  default = ["201.59.53.171/32"]
}

variable "key_name" {
  default = "terraform-aws"
}
