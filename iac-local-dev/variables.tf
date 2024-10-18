variable "environment_name" {
  description = "The name of the environment"
  type        = string
  default     = "dev"

  validation {
    condition = can(regex(module.commons.k8s_name_regex, var.environment_name))
    error_message = module.commons.k8s_name_description
  }
}