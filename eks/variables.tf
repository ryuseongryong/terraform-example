# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  default     = "ap-northeast-2"
  type        = string
}

variable "profile" {
  description = "AWS profile"
  default     = "ryuseongryong"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  default     = "demo-vpc"
  type        = string
}

variable "one_nat_gateway_per_az" {
  description = "One NAT Gateway per availability zone"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "demo"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  default     = "1.32"
  type        = string
}

variable "ecr_name" {
  description = "ECR repository name"
  default     = "private-registry"
  type        = string
}

# EKS OIDC ROOT CA Thumbprint - valid until 2037
variable "eks_oidc_root_ca_thumbprint" {
  description = "Thumbprint of Root CA for EKS OIDC, Valid until 2037"
  default     = "990F4193972F2BECF12DDEDA5237F9C952F20D9E"
  type        = string
  # default     = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}

# variable "coredns_version" {
#   description = "CoreDNS version"
#   type        = string
#   default     = "v1.9.3-eksbuild.3"
# }

# variable "kube_proxy_version" {
#   description = "kube-proxy version"
#   type        = string
#   default     = "v1.26.4-eksbuild.1"
# }

# variable "vpc_cni_version" {
#   description = "VPC CNI version"
#   type        = string
#   default     = "v1.12.6-eksbuild.2"
# }

# variable "ebs_csi_driver_version" {
#   description = "AWS EBS CSI Driver version"
#   type        = string
#   default     = "v1.18.0-eksbuild.1"
# }

# variable "node_groups" {
#   description = "values for node groups"
#   type = map(
#     object({
#       create         = bool
#       min_size       = number
#       desired_size   = number
#       max_size       = number
#       instance_types = list(string)
#       disk_size      = number
#       labels         = map(string)
#       max_pods       = number
#     })
#   )
# }