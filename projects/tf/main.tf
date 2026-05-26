module "vpc" {
  source             = "./vpc"
  vpc_name           = var.vpc_name
  cidr_block         = var.vpc_cidr
  availability_zones = [for s in var.subnets : s.availability_zone]
  subnet_cidrs       = [for s in var.subnets : s.cidr_block]
  app_cluster_name   = var.app_cluster_name

}

module "eks" {
  source                 = "./eks"
  app_cluster_name       = var.app_cluster_name
  endpoint_public_access = var.endpoint_public_access
  node_group_name        = var.node_group_name
  eks_node_role_name     = var.eks_node_role_name
  eks_cluster_role_name  = var.eks_cluster_role_name
  cluster_node_roles     = var.cluster_node_roles
  min_size               = var.min_size
  desired_size           = var.desired_size
  max_size               = var.max_size
  subnet_ids             = module.vpc.subnet_ids
  depends_on             = [module.vpc]
  instance_types         = var.instance_types
  capacity_type          = var.capacity_type
}


module "ecr" {
  source       = "./ecr"
  repositories = var.repositories
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  alias                  = "eks"
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

provider "helm" {
  alias = "eks"

  kubernetes =  {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}


module "argocd" {
  source = "./argocd"

  providers = {
    kubernetes = kubernetes.eks
    helm       = helm.eks
  }

  depends_on = [module.eks]
}