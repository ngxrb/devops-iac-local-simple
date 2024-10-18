variable "deployment_name" {
  description = "Deployment name (eg. local, saas)."
  type        = string
  default     = "local"

  validation {
    condition = can(regex(module.commons.k8s_name_regex, var.deployment_name))
    error_message = "Invalid deployment name. Must follow Kubernetes naming conventions."
  }
}

variable "kubernetes_config_path" {
  description = "Kubernetes Config Path"
  type        = string
  default     = "~/.kube/config"

  validation {
    condition = can(regex(module.commons.path_regex, var.kubernetes_config_path))
    error_message = "Invalid Kubernetes config path. Must be a valid path."
  }
}

variable "kubernetes_config_context" {
  description = "Kubernetes Config Context"
  type        = string
  default     = "rancher-desktop"
}
