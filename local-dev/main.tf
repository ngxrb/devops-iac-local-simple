terraform {
  required_version = ">= 1.9.7"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "rancher-desktop"
}

# Create the local-dev namespace
module "namespace" {
  source         = "../modules/namespace"
  namespace_name = "local-dev"
}

# Apply RBAC for local-dev
module "rbac" {
  source                           = "../modules/rbac"
  namespace                        = "local-dev"
  role_name                        = "dev-role"
  role_binding_subject_namespace    = "local-dev"
}

# Apply Network Policy for local-dev to allow traffic only from local-devops
module "network_policy" {
  source         = "../modules/network-policy"
  namespace      = "local-dev"
  allow_namespace = "local-devops"
}
