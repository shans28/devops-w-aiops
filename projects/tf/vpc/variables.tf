variable "cidr_block" {
  type = string
}

variable "subnet_cidrs" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "vpc_name" {
  type = string
}

variable "app_cluster_name" {
  description = "EKS cluster name for subnet tagging"
  type        = string
}