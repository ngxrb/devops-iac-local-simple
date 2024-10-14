variable "namespace" {
  description = "The namespace for which the Network Policy is being created"
  type        = string
}

variable "allow_namespace" {
  description = "The namespace from which traffic is allowed"
  type        = string
}

# Create the Network Policy
resource "kubernetes_network_policy" "policy" {
  metadata {
    name      = "allow-traffic-from-${var.allow_namespace}"
    namespace = var.namespace
  }

  spec {
    pod_selector {}
    policy_types = ["Ingress", "Egress"]

    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = var.allow_namespace
          }
        }
      }
    }

    egress {
      to {
        namespace_selector {
          match_labels = {
            name = var.allow_namespace
          }
        }
      }
    }
  }
}
