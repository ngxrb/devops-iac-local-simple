module "environment" {
  source      = "../modules/environment"
  deployment  = "local"
  environment = "test"
}