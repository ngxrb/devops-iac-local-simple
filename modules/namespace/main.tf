variable "namespace_name" {
  description = "The name of the namespace to create"
  type        = string
}

# Create the Namespace
resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace_name
  }
}
