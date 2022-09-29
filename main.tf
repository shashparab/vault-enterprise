module "namespaces" {
  source = "./modules/namespaces"
}

module "gitlab_integration" {
  source                  = "./modules/gitlab-integration"
  gitlab_hostname         = "localhost"
  aws_secret_backend_path = var.aws_secret_backend_path
}

# module "app_onboarding" {
#   source                  = "./modules/app-onboarding"
#   asset_ids               = var.asset_ids
#   aws_secret_backend_path = var.aws_secret_backend_path
#   gitlab_jwt_path         = module.gitlab_integration.jwt_path
# }

module "vault_identity" {
  source          = "./modules/vault-identity"
  asset_ids       = var.asset_ids
  gitlab_jwt_path = module.gitlab_integration.jwt_path
}