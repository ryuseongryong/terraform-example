data "aws_caller_identity" "current" {
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "2.3.1"

  repository_name = var.ecr_name

  repository_image_tag_mutability = "MUTABLE"
  repository_read_write_access_arns = [module.eks.eks_managed_node_groups.one.iam_role_arn, data.aws_caller_identity.current.arn]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

}