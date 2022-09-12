resource "vault_jwt_auth_backend" "gitlab_jwt_auth" {
  type         = "jwt"
  path         = var.gitlab_jwt_path
  jwks_url     = format("http://%s/-/jwks", var.gitlab_hostname)
  bound_issuer = var.gitlab_hostname
}

output "jwt_accessor" {
  value = vault_jwt_auth_backend.gitlab_jwt_auth.accessor
}

output "jwt_path" {
  value = vault_jwt_auth_backend.gitlab_jwt_auth.path
}