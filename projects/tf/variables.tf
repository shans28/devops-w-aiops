variable "region" {
  description = "The name of the region"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Value"
  type        = string
}

variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
}

variable "app_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "endpoint_public_access" {
  type = bool
}


variable "eks_node_role_name" {
  type        = string
  description = "Name of the IAM Role"
}

variable "cluster_node_roles" {
  type        = set(string)
  description = "List of roles to attach to cluster worker nodes"
}

variable "node_group_name" {
  type        = string
  description = "Name of the nodegroup"
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}
variable "disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}

variable "eks_cluster_role_name" {
  description = "name of the EKS cluster role"
  type        = string
}

variable "instance_types" {
  description = "type of instance as list"
  type        = list(string)
}

variable "capacity_type" {
  description = "Type of capacity for nodes (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}
variable "repositories" {
  type        = list(string)
  description = "name of ECR repo to create"
}