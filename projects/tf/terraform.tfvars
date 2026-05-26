subnets = [
  {
    name              = "prv01"
    cidr_block        = "10.1.1.0/24"
    availability_zone = "us-east-1a"
  },
  {
    name              = "prv-02"
    cidr_block        = "10.1.2.0/24"
    availability_zone = "us-east-1b"

  },
  {
    name              = "prv-03"
    cidr_block        = "10.1.3.0/24"
    availability_zone = "us-east-1c"
  }
]
vpc_name         = "vpc_app_01"
vpc_cidr         = "10.1.0.0/16"
region           = "us-east-1"
app_cluster_name = "eks-app-01"
cluster_node_roles = [
  "AmazonEKSWorkerNodePolicy",
  "AmazonEKS_CNI_Policy",
  "AmazonEC2ContainerRegistryReadOnly"
]
eks_cluster_role_name  = "eks-app-01-cluster-role"
eks_node_role_name     = "eks-app-01-node-role"
endpoint_public_access = true
node_group_name        = "eks-node-group"
instance_types         = ["t3.small"]
capacity_type          = "ON_DEMAND"

desired_size = 1
min_size     = 1
max_size     = 2

disk_size = 30
repositories = [
  "frontend",
  "gateway",
  "auth",
  "order-service",
  "orders",
  "product-service",
  "user-service"
]