module "commons" {
  source = "../iac-commons"
}

module "devops_namespace" {
  source          = "./modules/devops_namespace"
  deployment_name = var.deployment_name
}