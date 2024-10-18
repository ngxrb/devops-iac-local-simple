output "devops_namespace" {
  description = "DevOps namespace."
  value       = module.devops_environment.namespace
}

output "devops_service_account" {
  description = "DevOps ServiceAccount."
  value       = module.devops_environment.service_account
}

output "devops_role" {
  description = "DevOps role."
  value       = module.devops_environment.role
}