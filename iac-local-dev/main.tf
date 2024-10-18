module "commons" {
  source = "../iac-commons"
}

module "deployment" {
  source = "../iac-local"
}

module "environment" {
  source           = "../iac-commons/modules/environment"
  deployment_name  = module.deployment.deployment_name
  environment_name = var.environment_name
}