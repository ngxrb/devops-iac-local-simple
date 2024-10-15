resource "kubernetes_service_account" "custom_sa" {
  metadata {
    name      = local.sa_name
    namespace = local.namespace_name
  }
}