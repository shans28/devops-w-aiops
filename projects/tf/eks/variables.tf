variable "app_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "endpoint_public_access" {
  type = bool
}

variable "subnet_ids" {
  description = "List of subnet id where nodes will be deployed"
  type        = list(string)
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
