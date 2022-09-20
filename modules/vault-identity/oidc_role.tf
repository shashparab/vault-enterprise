# resource "vault_jwt_auth_backend" "oidc" {
#   path = "oidc"
#   default_role = "test-role"
# }

resource "vault_jwt_auth_backend_role" "oidc_role_readonly" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }

  backend               = "oidc"
  role_name             = "${each.value.heritage}-${each.value.csp}-${each.value.asset_id}-role-readonly"
  token_policies        = ["default"]
  user_claim            = "email"
  role_type             = "oidc"
  allowed_redirect_uris = ["http://localhost:8200/ui/vault/auth/oidc/oidc/callback", "http://localhost:8250/oidc/callback"]
  groups_claim          = "groups"
  oidc_scopes           = ["https://graph.microsoft.com/.default"]

}

resource "vault_jwt_auth_backend_role" "oidc_role_admin" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }

  backend               = "oidc"
  role_name             = "${each.value.heritage}-${each.value.csp}-${each.value.asset_id}-role-admin"
  token_policies        = ["default"]
  user_claim            = "email"
  role_type             = "oidc"
  allowed_redirect_uris = ["http://localhost:8200/ui/vault/auth/oidc/oidc/callback", "http://localhost:8250/oidc/callback"]
  groups_claim          = "groups"
  oidc_scopes           = ["https://graph.microsoft.com/.default"]

}