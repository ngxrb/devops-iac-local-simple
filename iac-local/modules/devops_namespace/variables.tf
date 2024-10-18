variable "deployment_name" {
  description = "Deployment name (eg. local, saas)."
  type        = string

  validation {
    condition = can(regex(module.commons.k8s_name_regex, var.deployment_name))
    error_message = "Invalid deployment name. Must follow Kubernetes naming conventions."
  }
}

variable "devops_environment_name" {
  description = "DevOps environment name"
  type        = string
  default     = "devops"

  validation {
    condition = can(regex(module.commons.k8s_name_regex, var.devops_environment_name))
    error_message = "Invalid DevOps environment name. Must follow Kubernetes naming conventions."
  }
}
