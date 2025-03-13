# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster" {
  description = "EKS cluster"
  value = {
    name     = module.eks.cluster_name
    id       = module.eks.cluster_id
    version  = module.eks.cluster_version
    arn      = module.eks.cluster_arn
    endpoint = module.eks.cluster_endpoint

    security_group_id = module.eks.cluster_security_group_id
    eks_managed_node_groups = module.eks.eks_managed_node_groups
    eks_node = module.eks.eks_managed_node_groups
  }
}
