module "commons" {
  source = "../../../iac-commons"
}

module "devops_environment" {
  source           = "../../../iac-commons/modules/environment"
  deployment_name  = var.deployment_name
  environment_name = var.devops_environment_name
}
