resource "kubernetes_role_binding" "binding" {
  metadata {
    name      = "${local.role_name}-binding"
    namespace = local.namespace_name
  }

  subject {
    kind      = "ServiceAccount"
    name      = local.sa_name
    namespace = local.namespace_name
  }

  role_ref {
    kind      = "Role"
    name      = local.role_name
    api_group = "rbac.authorization.k8s.io"
  }
}