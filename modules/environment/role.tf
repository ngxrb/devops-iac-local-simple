resource "kubernetes_role" "role" {
  metadata {
    name      = local.role_name
    namespace = local.namespace_name
  }

  rule {
    api_groups = [""]
    resources = ["pods", "services", "endpoints"]
    verbs = ["get", "list", "watch"]
  }

  rule {
    api_groups = [""]
    resources = ["configmaps"]
    verbs = ["get"]
  }
}
