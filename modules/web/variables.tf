variable "vpc_id" {}
variable "public_subnet_id" {}
variable "project_name" {}
variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}
