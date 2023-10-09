output "cluster_id" {
    value = module.eks.cluster_id
}

output "cluster_endpoint" {
    value = module.eks.cluster_endpoint
}
output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = module.eks.cluster_arn
}
output "cluster_iam_role_name" {
  description = "Status of the EKS cluster. One of `CREATING`, `ACTIVE`, `DELETING`, `FAILED`"
  value       = module.eks.cluster_iam_role_name
}

output "vpc_id" {
  value =  module.vpc.vpc_id
  
}
output "node_iam_arn" {
  description = "node arn "
  value       = module.eks.worker_iam_instance_profile_arns
}
output "worker_iam_role_name" {
  value = module.eks.worker_iam_role_name
}

output "eks_node_groups" {
   value = module.eks.node_groups
}
output "cluster_version" {
  value = module.eks.cluster_version
}

