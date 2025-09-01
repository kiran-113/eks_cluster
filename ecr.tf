# ----------------------------
# ECR Repository
# ----------------------------
resource "aws_ecr_repository" "app" {
  name                 = "springapp"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = true

}


resource "aws_ecr_registry_scanning_configuration" "default" {
  scan_type = "ENHANCED"

  rule {
    scan_frequency = "SCAN_ON_PUSH"
    repository_filter {
      filter      = "springapp"
      filter_type = "WILDCARD"
    }
  }

}
