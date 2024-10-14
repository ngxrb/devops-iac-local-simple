terraform {
  required_version = ">= 1.9.7"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "rancher-desktop"
}

# Create the local-devops namespace
module "namespace" {
  source         = "../modules/namespace"
  namespace_name = "local-devops"
}

# Allow local-devops to manage local-dev
module "rbac_dev" {
  source                           = "../modules/rbac"
  namespace                        = "local-dev"
  role_name                        = "dev-role"
  role_binding_subject_namespace    = "local-devops"
}

# Allow local-devops to manage local-pre
module "rbac_pre" {
  source                           = "../modules/rbac"
  namespace                        = "local-pre"
  role_name                        = "pre-role"
  role_binding_subject_namespace    = "local-devops"
}

# Allow local-devops to manage local-prod
module "rbac_prod" {
  source                           = "../modules/rbac"
  namespace                        = "local-prod"
  role_name                        = "prod-role"
  role_binding_subject_namespace    = "local-devops"
}
