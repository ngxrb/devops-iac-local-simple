resource "kubernetes_network_policy" "deny_all_external" {
  metadata {
    name      = "deny-all-external"
    namespace = local.namespace_name
  }

  spec {
    pod_selector {}

    policy_types = ["Ingress", "Egress"]

    ingress {
      from {
        pod_selector {}
      }
    }

    egress {
      to {
        pod_selector {}
      }
    }
  }
}
