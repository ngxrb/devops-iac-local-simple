terraform {
  required_version = ">= 1.9.7"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "rancher-desktop"
}

# Create the local-prod namespace
module "namespace" {
  source         = "../modules/namespace"
  namespace_name = "local-prod"
}

# Apply RBAC for local-prod
module "rbac" {
  source                           = "../modules/rbac"
  namespace                        = "local-prod"
  role_name                        = "prod-role"
  role_binding_subject_namespace    = "local-prod"
}

# Apply Network Policy for local-prod to allow traffic only from local-devops
module "network_policy" {
  source         = "../modules/network-policy"
  namespace      = "local-prod"
  allow_namespace = "local-devops"
}
