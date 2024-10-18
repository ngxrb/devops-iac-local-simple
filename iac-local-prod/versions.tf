terraform {
  required_version = ">= 1.9.7"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "rancher-desktop"
}