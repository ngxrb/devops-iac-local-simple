module "commons" {
  source = "../iac-commons"
}

module "deployment" {
  source = "../iac-local"
}

module "environment" {
  source           = "../iac-commons/modules/environment"
  deployment_name  = module.deployment.deployment_name
  environment_name = module.deployment.devops_namespace_name
}