variable "repositories" {
  type = list(string)
}
variable "image_tag_mutability" {
  type    = string
  default = "MUTABLE"
}
variable "scan_image_on_push" {
  type    = bool
  default = true
}

variable "force_delete_repo" {
  type    = bool
  default = true
}

resource "aws_ecr_repository" "repos" {
  for_each     = toset(var.repositories)
  name         = each.value
  force_delete = var.force_delete_repo
  image_scanning_configuration {
    scan_on_push = var.scan_image_on_push
  }
  image_tag_mutability = var.image_tag_mutability
}