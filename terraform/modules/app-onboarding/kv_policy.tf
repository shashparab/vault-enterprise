data "vault_policy_document" "kv_readonly_policy_document" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  rule {
    path         = "${each.value.asset_id}/*"
    capabilities = ["read"]
  }
  #   rule {
  #     path         = "{{identity.entity.aliases.${vault_jwt_auth_backend.gitlab_jwt_auth.accessor}.metadata.project_path}}/*"
  #     capabilities = ["read"]
  #   }
}

resource "vault_policy" "kv_readonly_policy" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  name      = "kv-${each.value.asset_id}-readonly"
  policy    = data.vault_policy_document.kv_readonly_policy_document[each.key].hcl
  namespace = "${each.value["heritage"]}/${each.value["csp"]}"
}

data "vault_policy_document" "kv_admin_policy_document" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  rule {
    path         = "${each.value.asset_id}/*"
    capabilities = ["create", "read", "update", "delete", "list"]
  }
}

resource "vault_policy" "kv_admin_policy" {
  for_each = {
    for asset_id_name in var.asset_ids : "${asset_id_name.asset_id}.${asset_id_name.csp}.${asset_id_name.heritage}" => asset_id_name
  }
  name      = "kv-${each.value.asset_id}-admin"
  policy    = data.vault_policy_document.kv_admin_policy_document[each.key].hcl
  namespace = "${each.value["heritage"]}/${each.value["csp"]}"
}