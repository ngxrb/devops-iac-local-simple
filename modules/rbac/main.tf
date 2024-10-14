variable "namespace" {
  description = "The namespace for which the RBAC role and binding are being created"
  type        = string
}

variable "role_name" {
  description = "The name of the role to create"
  type        = string
}

variable "role_binding_subject_namespace" {
  description = "The namespace from which access will be granted"
  type        = string
}

# Create the Role
resource "kubernetes_role" "role" {
  metadata {
    name      = var.role_name
    namespace = var.namespace
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "configmaps", "deployments"]
    verbs      = ["get", "list", "watch", "create", "update", "delete"]
  }
}

# Create the RoleBinding
resource "kubernetes_role_binding" "binding" {
  metadata {
    name      = "${var.role_name}-binding"
    namespace = var.namespace
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = var.role_binding_subject_namespace
  }

  role_ref {
    kind     = "Role"
    name     = var.role_name
    api_group = "rbac.authorization.k8s.io"
  }
}
