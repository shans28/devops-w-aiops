output "cluster_name" {
  value = aws_eks_cluster.app_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.app_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.app_cluster.certificate_authority[0].data
}

output "node_group_name" {
  value = aws_eks_node_group.node_group.node_group_name
}

output "node_group_arn" {
  value = aws_eks_node_group.node_group.arn
}

output "node_group_status" {
  value = aws_eks_node_group.node_group.status
}