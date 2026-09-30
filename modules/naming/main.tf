locals {
  name = lower("${var.project}${var.separator}${var.environment}")
}
