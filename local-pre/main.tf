terraform {
  required_version = ">= 1.9.7"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "rancher-desktop"
}

# Create the local-pre namespace
module "namespace" {
  source         = "../modules/namespace"
  namespace_name = "local-pre"
}

# Apply RBAC for local-pre
module "rbac" {
  source                           = "../modules/rbac"
  namespace                        = "local-pre"
  role_name                        = "pre-role"
  role_binding_subject_namespace    = "local-pre"
}

# Apply Network Policy for local-pre to allow traffic only from local-devops
module "network_policy" {
  source         = "../modules/network-policy"
  namespace      = "local-pre"
  allow_namespace = "local-devops"
}
