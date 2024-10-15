variable "deployment" {
  description = "The deployment name (eg. local, saas)"
  type        = string
}

variable "environment" {
  description = "The environment for this deployment (e.g. dev, prod)"
  type        = string
}

locals {
  namespace_name = "${var.deployment}-${var.environment}"
  role_name      = "${var.deployment}-${var.environment}-role"
  sa_name        = "${var.deployment}-${var.environment}-sa"
}