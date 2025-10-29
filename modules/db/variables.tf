variable "project_name" {}
variable "private_subnets" {
  type = list(string)
}

variable "app_sg_id" {}
variable "db_name" {
  default = "appdb"
}

variable "db_user" {
  default = "admin"
}

variable "db_password" {
  default = "Password123!"  # In enterprise, use secrets manager
}
