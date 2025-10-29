variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "3tier-webapp"
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
}
