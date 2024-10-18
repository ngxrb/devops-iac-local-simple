module "commons" {
  source = "../iac-commons"
}

module "deployment" {
  source = "../iac-local"
}

module "environment" {
  source           = "../iac-commons/modules/environment"
  deployment_name  = "local"
  environment_name = "prod"
}