terraform {
  required_version = module.deployment.terraform_required_version
}

provider "kubernetes" {
  config_path    = module.deployment.kubernetes_config_path
  config_context = module.deployment.kubernetes_config_context
}